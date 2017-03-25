FactoryGirl.define do

  factory :message do
    body       {Faker::Lorem.word}
    image      {Faker::File.file_name('path/to')}
    created_at {Faker::Time.between(2.days.ago, Time.now)}

    trait :with_user_and_message do
      user
      group
    end

    factory :invalid_message do
      body ""
    end
  end
end
