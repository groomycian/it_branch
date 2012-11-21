FactoryGirl.define do
  factory :teacher do
    name      "John"
    surname   "Doe"
    email     "John@test.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end