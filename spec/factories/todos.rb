FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
  end
end
