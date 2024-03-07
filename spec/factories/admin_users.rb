# spec/factories/admin_users.rb

FactoryBot.define do
  factory :admin_user do
    email { 'admin123@example.com' }
    password { 'password12' }
    password_confirmation { 'password12' }
  end
end
