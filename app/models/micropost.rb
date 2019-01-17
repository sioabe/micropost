class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {maximum: 255 }
  
  #課題用
  has_many :reverses_of_favorites, class_name:'Favorite'
  has_many :favorite_users, through: :reverses_of_favorites, source: :user #micropostをお気に入りしているuser
  
  
end
