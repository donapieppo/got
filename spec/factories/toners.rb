FactoryBot.define do
  factory :toner do
    association :organization
    association :toner_model
    number 2
  end
end


