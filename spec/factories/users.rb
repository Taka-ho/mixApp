FactoryBot.define do
  factory :user do
    nickname              { 'asdf' }
    email                 { 'j1403239@gmail.com' }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    mania_histry {'2'}
    enjoy_point {'asdfasdf'}
    post
    before(:create) do |post|
      post.maker = create(:post)
    end
  end
end
