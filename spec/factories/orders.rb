
FactoryGirl.define do
  factory :part do
    part_no 12856
    name "plasma launcher"
    removed false
  end

  factory :order do
    description  "my rocket order"
    association :manager, factory: :manager
  end
end
