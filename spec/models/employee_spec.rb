require 'rails_helper'

describe Employee, type: :model do
  let!(:employee) { Employee.create!( first_name: "Factory", last_name: "Girl", employee_id: 123, password: "password", is_manager: true, warehouse_id: 5) }

  describe "validations" do
    it "is invalid when a first name is not entered" do
      employee.first_name = nil
      expect(employee).to be_invalid
    end

    it "is invalid when a last name is not entered" do
      employee.last_name = nil
      expect(employee).to be_invalid
    end

    it "is inavalid when an employee id is not entered" do
      employee.employee_id = nil
      expect(employee).to be_invalid
    end

    it "is valid if manager" do
      expect(employee.is_manager).to eq true
    end

    it "is valid if not a manager" do
      employee.is_manager = false
      expect(employee).to be_valid
    end

    it "invalid if not a manager or employee" do
      employee.is_manager = nil
      expect(employee).to be_invalid
    end

    it "is invalid if employee doesn't have a warehouse id" do
      expect(employee.warehouse_id).to eq 5
    end
  end

  describe "authenticate method" do
    it "returns employee when password entered is correct" do
      expect(employee.authenticate("password")).to eq Employee.find_by(employee_id: 123)
    end
    it "returns false when password entered is incorrect" do
      expect(employee.authenticate("something")).to be false
    end
  end

end
