FactoryBot.define do

    factory :post do
      content {"aaaaaaaaa"}
      user_id {'23'}
      created_at {'2020/10/01'}
      updated_at {'2020/12/12'}
      user


    after(:build) do |post|
      post.images.attach(io: File.open("files/test_image.jpg"), filename: 'test_image.jpg')
    end
  end
  end