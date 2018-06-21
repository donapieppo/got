FactoryBot.define do
  factory :printer_model do
    association :vendor
    sequence(:name) { |n| "PrinterTest #{n}" }
  end
end

