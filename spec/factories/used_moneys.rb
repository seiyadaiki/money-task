FactoryBot.define do

  factory :used_money do
    association  :user

    date                   { '2020-1-1'}
    location               { '東京' }
    what                   { '服' }
    how_much               { '1000' }
    way_id                 { 1 }
  end
end
