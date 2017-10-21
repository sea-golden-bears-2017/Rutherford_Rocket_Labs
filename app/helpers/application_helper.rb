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

  def create_parts
    if quantities.inject(0){ |sum, q| sum + q } == 0
      nil
    else
      order = Order.last
      warehouse = order.warehouse
      parts = extract_part_information
      quantities.count.times do |number|
        quantities[number].times {Part.create(part_no: parts[number][0], name: parts[number][1], warehouse: warehouse, order: order, removed: false)}
      end
    end
  end

  def count_parts(order, part)
    order.parts.where(name: part.name).count
  end


private
  def extract_part_information
    params[:part_desc].map do |part|
      part.split('-', 2)
    end
  end

  def quantities
    params[:quantity].map{ |quantity| quantity.to_i }
  end
end
