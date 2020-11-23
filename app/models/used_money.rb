class UsedMoney < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :way

  with_options presence: true do
    validates :when
    validates :how_much, format: { with:/\A[0-9]+\z/, message: 'is invalid. Input number.' }
    validates :way_id
  end
end
