class Pet < ApplicationRecord
  validates :user_id, presence: true
  validates :type, presence: true
  self.inheritance_column = :_type_disabled#typeでエラーがでないよう
  
  validates :image, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :description, presence: true
  
  belongs_to :user
  has_one :favorite #欲しいボタンが一度に何人からも押されないように
  has_many :comments
  
  mount_uploader :image, ImageUploader
  
  
end
