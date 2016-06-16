FactoryGirl.define do
  factory :organization do
    sequence(:name) { |n| "DipTest #{n}" }
    description 'Dipartimento di Test'
  end
end

