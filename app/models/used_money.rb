class UsedMoney < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :way
end
