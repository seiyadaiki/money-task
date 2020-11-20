class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :used_monies
  has_one :goal
  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,12}\z/, message: 'is invalid. Input half-width characters.' }
    validates :password_confirmation, confirmation: true
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :namekana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :birthday
  end
end
