# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :food do
    user nil
    consumed_on "2014-02-03"
    name "MyString"
    description "MyText"
    quantity 1
    serving_description "MyString"
    serving_id "MyString"
    calories 1
    protein 1
    fat 1
    carbs 1
    fiber 1
  end
end
