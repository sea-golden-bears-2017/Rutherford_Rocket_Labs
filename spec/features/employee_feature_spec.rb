require 'rails_helper'

describe 'Employee Login', type: :feature do
  let!(:warehouse) { create(:warehouse) }
  let!(:employee) { create(:employee, warehouse: warehouse)}
  scenario "Employee logs in successfully" do
    visit "/"
    fill_in "employee_id", :with => 12345
    fill_in "password", :with => "password"
    click_button "login"
    expect(page).to have_content "Inventory Management Portal"
  end
  scenario "Employee logs in unsuccessfully" do
    visit "/"
    fill_in "employee_id", :with => 19999
    fill_in "password", :with => "password"
    click_button "login"
    expect(page).to have_content "The employee number or password entered is incorrect"
  end
end
