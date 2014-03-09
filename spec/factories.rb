FactoryGirl.define do
  factory :user do
    name     "deitrick"
    email    "ajdeitrick@gmail.com"
    provider "github"
  end
end