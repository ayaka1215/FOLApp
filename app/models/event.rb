class Event < ApplicationRecord
    has_many :reservations

    validates :title, presence: true, length: { maximum: 40 }
    validates :date, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :content, presence: true, length: { maximum: 1000 }
    validates :place, presence: true, length: { maximum: 50 }
    # validate :end_check
    # validate :start_check
    mount_uploader :image, ImageUploader

    # def end_check
    #   errors.add(:end_time, "は開始時刻より遅い時間を選択してください") if self.start_time > self.end_time
    # end
  
    # def start_check
    #   errors.add(:date, "は現在の日時より遅い日時を選択してください") if self.date < Time.now
    # end
end
