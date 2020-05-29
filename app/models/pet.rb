class Pet < ApplicationRecord
  validates :user_id, presence: true
  validates :type, presence: true
  self.inheritance_column = :_type_disabled#typeでエラーがでないよう
  
  validates :image, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :description, presence: true
  
  belongs_to :user
  has_many :favorites 
  has_many :favorited_users, through: :favorites, source: :user#誰にいいねされたか
 
  has_many :comments, dependent: :destroy#petが削除された際にcommentも
  
  mount_uploader :image, ImageUploader
  
  
end
