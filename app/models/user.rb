class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :groups, dependent: :destroy
  has_many :projects, through: :groups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
