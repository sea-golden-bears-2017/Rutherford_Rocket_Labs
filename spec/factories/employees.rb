FactoryGirl.define do
  factory :employee do
    first_name "Kelly"
    last_name "Last"
    employee_id 12345
    password "password"
    is_manager false
    belongs_to 
  end
end
