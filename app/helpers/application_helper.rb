module ApplicationHelper
  def logged_in?
    return session[:user_id] != nil
  end

  def manager_logged_in?
    if logged_in?
      employee = Employee.find(session[:user_id])
      return employee.is_manager
    else
      nil
    end
  end

  def employee_logged_in
    Employee.find(session[:user_id])
  end

  # create parts helper methods
  def quantity_zero?
    return quantities.inject(0){ |sum, q| sum + q } == 0
  end


  def create_parts
    generate_part_objects(extract_part_information, Order.last)
  end

# order update helper methods

def find_order
  Order.find(params[:id])
end

def order_difference
  find_difference(quantity_ordered(find_order), quantity_received)
end

def order_part_numbers_only
  find_order.parts.map{ |part| part.part_no }.uniq
end

def quantity_received_zero?
  return quantity_received.inject(0){ |sum, q| sum + q } == 0
end

def update_parts
  order_part_numbers_only.each do |part_no|
    index = Order.last.parts.index(part_no)
    parts = find_order.find_by(part_no: part_no)

    if order_difference[index] == 0

      parts.each do |part|
        part.recieved_by_id = employee_logged_in.id
        part.save
      end

    elsif
      order_difference[index] < 0

      quantity_received[index].times do |number|
        parts[number].received_by_id = employee_logged_in.id
        parts[number].save
      end

    else
      quantity_ordered(find_order)[index].times do |number|
        parts[number].received_by_id = employee_logged_in.id
        parts[number].save
      end
      order_difference[index].times { Part.create(part_no: parts[0].part_no, name: parts[0].name, received_by_id: employee_logged_in.id, order: find_order, warehouse: find_order.warehouse) }
    end
  end
end



private

#create parts path helper methods
  def extract_part_information
    params[:part_desc].map do |part|
      part.split('-', 2)
    end
  end

  def quantities
    params[:quantity].map{ |quantity| quantity.to_i }
  end
end

def generate_part_objects(parts, order)
  quantities.count.times do |number|
    quantities[number].times {Part.create(part_no: parts[number][0], name: parts[number][1], warehouse: order.warehouse, order: order, removed: false)}
  end
end

#update order helper methods
def quantity_received
  params[:quantity_received].map{ |quantity| quantity.to_i }
end

def quantity_ordered(order)
  order.unique_parts.map do |part|
    order.part_count(part)
  end
end

def find_difference(ordered, received)
  ordered.zip(received).map{ |o, r| o - r }
end
