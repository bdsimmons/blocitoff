# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    title "MyString"
    description "MyText"
    user nil
  end
end
