class Room < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :adderss, :image)
  end

  include ActiveModel::Validations
  attr_accessor :img_path

  validates :name, presence: true
  validates :introduction, presence: true, length: { in: 1..255 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :address, presence: true
end
