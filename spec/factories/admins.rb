FactoryGirl.define do
  factory :admin do
    username 'Test Admin'
    password 'foobar'
    password_confirmation 'foobar'
  end
end