class Pet < ApplicationRecord
  validates :user_id, presence: true
  validates :type, presence: true
  self.inheritance_column = :_type_disabled#typeでエラーがでないよう
  
  validates :image, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :description, presence: true
  
  belongs_to :user
  has_many :favorite 
 
  has_many :comments
  
  mount_uploader :image, ImageUploader
  
  
end
