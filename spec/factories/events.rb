FactoryGirl.define do
  factory :event do
    sequence(:name)    {|i| "#{i}" }
    sequence(:place)   {|i| "nickname#{i}" }
    start_time         Time.local(2015, 1)
    end_time           Time.local(2016, 1)
    sequence(:content) {|i| "nickname#{i}" }

    trait :with_blank do
      name       nil
      place      nil
      start_time nil
      end_time   nil
      content    nil
    end
  end
end
