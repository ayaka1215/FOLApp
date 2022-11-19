class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user_id, uniqueness: { scope: :event_id,
    message: "予約済みです"
  }

  # TOBE：予約期限バリデーション（イベント開始1週間前）
end
