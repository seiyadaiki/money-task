class Way < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '現金' },
    { id: 2, name: 'クレジットカード' },
    { id: 3, name: '電子マネー' }
  ]

  include ActiveHash::Associations
  has_many :used_moneys
end
