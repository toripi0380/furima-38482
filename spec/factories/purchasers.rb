FactoryBot.define do
  factory :purchaser do
    association :user, :item
    
  end
end
