require 'factory_girl'

FactoryGirl.define do

  factory :user do |u|
    u.sequence(:name) {|n| "user-#{n}" }
    u.sequence(:email) {|n| "sergey.sntu+n#{n}@gmail.com"}
    u.password  "password"
    u.password_confirmation "password"
  end

  factory :invitation do |i|
    i.token Invitation.get_random_token
    i.sequence(:email) {|i| "sergey.sntu+n#{i}@gmail.com"}
  end

end


