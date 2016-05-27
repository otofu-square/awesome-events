FactoryGirl.define do
  factory :event do
    name       'otofu'
    place      'tokyo'
    content    'content_test'
    start_time Time.now
    end_time   Time.now
  end
end
