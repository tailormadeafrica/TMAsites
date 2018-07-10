
FactoryGirl.define do
  factory :safari_type, :class => Refinery::SafariTypes::SafariType do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

