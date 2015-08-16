require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }

    pass = Faker::Internet.password
    f.password { pass }
    f.password_confirmation { pass }
  end
end
