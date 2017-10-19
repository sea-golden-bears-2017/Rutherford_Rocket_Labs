require 'rails_helper'

describe Employee, type: :model do
  describe "authenticate method" do
    let(:employee) { Employee.create(employee_id: 123, password: "password") }
    it "returns employee when password entered is correct" do
      expect(employee.authenticate("password")).to eq Employee.find_by(employee_id: 123)
    end
    it "returns false when password entered is incorrect" do
      expect(employee.authenticate("something")).to be false
    end
  end

end
