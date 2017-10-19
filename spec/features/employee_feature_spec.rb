require 'rails_helper'

describe 'Employee Login', type: :feature do
  let!(:employee) {  Employee.create!(employee_id: 123, password: "password", warehouse: Warehouse.create!(city: "New York")) }
  scenario "Employee logs in successfully" do
    visit "/"
    fill_in "employee_id", :with => 123
    fill_in "password", :with => "password"
    click_button "login"
    expect(page).to have_content "Inventory Mangement Portal"
  end
  scenario "Employee logs in unsuccessfully" do
    visit "/"
    fill_in "employee_id", :with => 12345
    fill_in "password", :with => "password"
    click_button "login"
    expect(page).to have_content "The employee number or password entered is incorrect"
  end
end
