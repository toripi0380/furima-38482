FactoryBot.define do
  factory :item do
    association :user
    product              {'空気清浄機'}
    description          {'空気をきれいにするもの'}
    category_id          {2}
    condition_id         {2}
    shipping_charges_id  {2}
    prefecture_id        {2}
    number_of_days_id    {2}
    price                {2000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/1139-l2.jpeg'), filename: '1139-l2.jpeg')
    end
  end
end
