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

  def quantity_zero?
    return quantities.inject(0){ |sum, q| sum + q } == 0
  end

  def create_parts
    generate_part_objects
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

def generate_part_objects
  quantities.count.times do |number|
    quantities[number].times {Part.create(part_no: extract_part_information[number][0], name: extract_part_information[number][1], warehouse: Order.last.warehouse, order: Order.last, removed: false)}
  end
end
