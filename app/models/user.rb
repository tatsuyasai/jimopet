class User < ApplicationRecord
  validates :name, presence: true #presenceで空白禁止
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 15}
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/ #数字アルファベット混合で８〜３２文字
  validates :password, presence: true, length: { minimum: 8, maximum: 32}, format: { with: VALID_PASSWORD_REGEX}
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ #@と.必須
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  
  has_secure_password #password_confirmation（パスワード確認用の再入力）が使える
  
  has_many :pets
  has_many :favorites
  has_many :favorite_pets, through: :favorites, source: 'pet' #userが紐づいているfavoriteが紐づいているpetを取得
  has_many :comments
end
