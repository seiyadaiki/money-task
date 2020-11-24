class UsedMoney < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :way

  with_options presence: true do
    validates :date
    validates :what
    validates :how_much, numericality: { with:/\A[0-9]+\z/, message: "is invalid. Input half-width numbers" }
    validates :way_id, numericality: { other_than: 0, message: "can't be blank" }
  end
end
