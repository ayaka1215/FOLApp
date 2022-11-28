class Event < ApplicationRecord
    has_many :reservations

    validates :title, presence: true, length: { maximum: 40 }
    validates :date, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :content, presence: true, length: { maximum: 1000 }
    validates :place, presence: true, length: { maximum: 50 }
    validate :time_check
    # validate :date_check
    mount_uploader :image, ImageUploader

    # end_timeはstart_timeより遅い時間
    def time_check
        if self.start_time > self.end_time
            errors.add("終了時刻は開始時刻より遅い時間を選択してください")
        end
    end
  
    # def date_check
    #     if self.date < Date.today + 3
    #         errors.add("イベントを登録・変更できるのは開始日の3日前までです。")
    #     end
    # end
end
