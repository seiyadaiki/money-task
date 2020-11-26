class UsedMoney < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :way

  with_options presence: true do
    validates :date
    validates :what, length: { maximum: 10 }
    validates :how_much, numericality: { with:/\A[0-9]+\z/, message: "is invalid. Input half-width numbers" }
    validates :way_id, numericality: { other_than: 0, message: "can't be blank" }
  end
  validates :location, length: { maximum: 10 }
end
