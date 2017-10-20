FactoryGirl.define do
  factory :employee do
    first_name "Kelly"
    last_name "Last"
    employee_id 12345
    password "password"
    is_manager true
    factory :manager do
      is_manager true
    end
  end
end
