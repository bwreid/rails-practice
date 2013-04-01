# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    description "MyString"
    image "MyString"
    cost "9.99"
    lat 1.5
    lon 1.5
    address "MyString"
    user_id 1
  end
end
