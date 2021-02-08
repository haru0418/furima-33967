class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: ture
  validates :first_name, presence: ture
  validates :last_name, presence: ture
  validates :first_name_kana, presence: ture
  validates :last_name_kana, presence: ture
  validates :birth_day, presence: ture

end
