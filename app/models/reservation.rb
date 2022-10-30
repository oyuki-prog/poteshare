require 'date'
class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional: true

  validates :start_date, presence: true
  validates :end_date, presence: true, length: { in: 1..255 }
  validates :guests_num, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :room_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :start_end_check
  validate :now_start_check

  def start_end_check
    errors.add(:end_date, 'はチェックイン日より前の日付で登録できません') unless
    start_date < end_date
  end

  def now_start_check
    errors.add(:start_date, 'は今日より前の日付で登録できません') unless
    start_date > Date.today
  end

  def total_price
    self.room.price * (end_date - start_date).to_i * guests_num
  end
  
end
