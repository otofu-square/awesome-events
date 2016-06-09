FactoryGirl.define do
  factory :user do
    provider             'twitter'
    sequence(:uid)       {|i| "#{i}" }
    sequence(:nickname)  {|i| "nickname#{i}" }
    sequence(:image_url) {|i| "http://test.com/test#{i}.jpg" }
  end
end
