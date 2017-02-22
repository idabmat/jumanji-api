FactoryGirl.define do
  factory :player do
    name 'Alan Parish'
    logins { { facebook_token: '123abc' } }
    game
  end
end
