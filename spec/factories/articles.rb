FactoryGirl.define do
  factory :article do
    title
    text { Faker::Lorem.paragraph }
    user
  end
end
