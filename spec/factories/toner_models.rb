FactoryGirl.define do
  factory :toner_model do
    association :vendor 
    sequence(:name) { |n| "TonerTest #{n}" }
  end
end

