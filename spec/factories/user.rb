FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Rolland Golland #{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password 'password'
  end

end
