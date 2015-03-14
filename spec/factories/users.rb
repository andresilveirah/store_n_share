FactoryGirl.define do
  sequence :email do |n|
      "email#{n}@factory.com"
  end
    
  factory :user do
    name "MyString"
    email 
    password "12345678"
    password_confirmation "12345678"
  end
end
