FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.paragraph }
    article
    user
  end
end
