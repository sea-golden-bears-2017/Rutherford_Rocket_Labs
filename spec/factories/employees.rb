FactoryGirl.define do
  factory :employee do
    first_name "MyString"
    last_name "MyString"
    employee_id 1
    password_digest "MyString"
    is_manager false
    belongs_to ""
  end
end
