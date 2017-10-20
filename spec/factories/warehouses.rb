FactoryGirl.define do
  factory :warehouse do
    city "DaMOON"
    location_code {"#{warehouse.city.upcase[0..2]}-#{rand(10000..99999).to_s}"}
  end
end
