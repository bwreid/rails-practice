# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :declaration do
    url "MyString"
    words 1
    full_text "MyText"
  end
end
