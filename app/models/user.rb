class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
  validates :nickname, presence: true
  validates :first_name,
            format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ },
            presence: true
  validates :family_name,
            format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ },
            presence: true
  validates :first_name_kana,
            format: { with: /\A([ァ-ン]|ー)+\z/ },
            presence: true
  validates :family_name_kana,
            format: { with: /\A([ァ-ン]|ー)+\z/ },
            presence: true
  validates :birth_day, presence: true
end
