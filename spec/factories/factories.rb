FactoryGirl.define do
    factory :user do |f|
    f.sequence(:username) { |n| "admin#{n}" }
    f.sequence(:email) { |n| "senthil#{n}@sagework.com" }
    f.password 'admin'
    f.password_confirmation 'admin'
  end
end