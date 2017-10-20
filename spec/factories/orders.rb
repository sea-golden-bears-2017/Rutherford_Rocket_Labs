
FactoryGirl.define do
  factory :part do
    part_no 12856
    name "plasma launcher"
    removed false
  end
  factory :warehouse do
    city "DaMOON"
    location_code {"#{city.upcase[0..2]}-#{rand(10000..99999).to_s}"}
  end
  factory :order do
    description  "my rocket order"
    association :manager, factory: :manager
  end
end
