FactoryGirl.define do

  factory :message do
    body       {Faker::Lorem.word}
    image      "test.png"
    user_id    1
    group_id   1
    created_at {Faker::Time.between(2.days.ago, Time.now)}

    factory :invalid_message do
      body ""
    end
  end
end
