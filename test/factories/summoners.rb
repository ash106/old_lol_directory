# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :summoner do
    name "MyString"
    server "MyString"
    icon_id 1
    riot_id 1
    acct_id 1
    user nil
  end
end
