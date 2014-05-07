# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "Ben#{i}" }
    sequence(:email) { |i| "testuser#{i}@domain.com" }
    password "password"
    password_confirmation "password"
    
    factory :ben do
      name "Ben"
      email "ben@test.com"
      password "password"
      password_confirmation "password"
    end
  end
end
