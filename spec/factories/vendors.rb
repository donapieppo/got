FactoryGirl.define do
  factory :vendor do
    sequence(:name) { |n| "VendorNameTest #{n}" }
  end
end
