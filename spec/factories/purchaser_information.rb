FactoryBot.define do
  factory :purchaser_information do
    postal_code      {'111-1111'}
    prefecture_id    {2}
    city             {'奈良市'}
    block            {'青山13-1'}
    phone_number     {'00011112222'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end