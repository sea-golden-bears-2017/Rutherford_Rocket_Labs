require 'rails_helper'

describe Employee, type: :model do
  let(:employee) { Employee.create(employee_id: 123, password: "password") }

  describe "validations" do
    it "is invalid when a first name is not entered"
    it "is invalid when a last name is not entered"
    it "is inavalid when an employee id is not entered"
    it "is valid if one of the radio buttons is checked"
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
