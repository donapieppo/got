FactoryBot.define do
  factory :printer do
    association :organization
    association :printer_model
    sequence(:name) { |n| "Sibilla #{n}" }
  end
end

