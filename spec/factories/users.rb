FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { 'kkk000' }
    password_confirmation { password }
    name                  { '金銭太郎' }
    namekana              { 'キンセンタロウ' }
    birthday              { '1990-01-01' }
  end
end