require 'faker'

FactoryBot.define do
  factory :customer do
    name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email 
    phone '5558710117'
    comment "a peace of sentence"
  end
end
