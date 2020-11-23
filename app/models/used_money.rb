class UsedMoney < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :way

  with_options presence: true do
    validates :when
    validates :how_much
    validates :way_id
  end
    
end
