class Way < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '現金' },
    { id: 3, name: 'クレジットカード' },
    { id: 4, name: '電子マネー' },
  ]

  include ActiveHash::Associations
  has_many :used_moneys
end