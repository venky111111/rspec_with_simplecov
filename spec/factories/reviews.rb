FactoryBot.define do
  factory :review do
    content { "Niice One" }
    user
    product
  end
end
