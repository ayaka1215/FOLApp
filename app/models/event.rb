class Event < ApplicationRecord
    has_many :reservations

    validates :title, presence: true, length: { maximum: 30 }
    validates :event_date, presence: true
    validates :event_start_time, presence: true
    validates :event_end_time, presence: true
    validates :content, presence: true, length: { maximum: 1000 }
    validates :place, presence: true, length: { maximum: 50 }
    validate :end_check
    validate :start_check
    mount_uploader :image, ImageUploader

    def end_check
      errors.add(:event_end_time, "は開始時刻より遅い時間を選択してください") if self.event_start_time > self.event_end_time
    end
  
    def start_check
      errors.add(:event_start_time, "は現在の日時より遅い時間を選択してください") if self.event_start_time < Time.now
    end
end
