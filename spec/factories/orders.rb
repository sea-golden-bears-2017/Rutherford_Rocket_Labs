
FactoryGirl.define do
  factory :part do
    part_no 12856
    name "plasma launcher"
    warehouse
    removed false
  end

  factory :order do
    description  "my rocket order"
    warehouse
    association :manager, factory: :manager

    factory :order_with_parts do
      transient do
        parts_count 10
      end

      after(:create) do |order, evaluator|
        create_list(:part, evaluator.parts_count, order: order)
      end
    end
  end
end
