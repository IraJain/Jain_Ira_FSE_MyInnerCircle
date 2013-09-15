FactoryGirl.define do
  factory :user do
    first_name "Manu "
    last_name "Jain"
    email    "manu@test.com"
    password "pass1234"
    password_confirmation "pass1234"
  end

  factory :user1 do
    first_name "Ira "
    last_name "Jain"
    email    "ira@test.com"
    password "pass1234"
    password_confirmation "pass1234"
  end

  factory :posting do
    title "test title posting "
    description "description for test case"
    phone    "123456"
    location   "palo alto"

  end

end