# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stat do
    steps 1
    sleep 1.5
    date "2014-02-06"
    user nil
  end
end
