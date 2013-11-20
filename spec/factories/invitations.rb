# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
    sender_id 1
    recipient_email "MyString"
    token "MyString"
    sent_at "2013-11-19 19:03:42"
  end
end
