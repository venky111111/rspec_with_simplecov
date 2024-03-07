FactoryBot.define do
  factory :user do
    name { "hima" }
    sequence :email do |n|
      "user#{n}@example.com"
    end
  end
end

