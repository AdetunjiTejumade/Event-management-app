FactoryBot.define do
  factory :event do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraphs }
    location { Faker::Lorem.word }
    start_date { Faker::Time.between(from: 2.days.ago, to: Time.now) }
    end_date { Faker::Time.forward(days: 23, period: :morning) }
    in_active { false }
    paid { false }
    user_id { nil }
  end
end
