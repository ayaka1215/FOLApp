class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user_id, uniqueness: { scope: :event_id,
    message: "予約済みです"
  }

  validate :reservation_deadline

  def reservation_deadline
    today = Date.today
    if event.date.before? today - 3
      errors.add(:date, "予約期限は3日前までです")
    end
  end
end
