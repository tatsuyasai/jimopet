class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  
  validates :content, presence: true #presenceで空白禁止
end
