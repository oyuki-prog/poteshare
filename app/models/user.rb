class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :rooms, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :avatar)
  end

  include ActiveModel::Validations

  validates :name, presence: true
end
