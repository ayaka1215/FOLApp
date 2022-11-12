class Event < ApplicationRecord
    has_many :reservations

    validates :title, presence: true, length: { maximum: 30 }
    validates :event_date, presence: true
    validates :event_start_time, presence: true
    validates :event_end_time, presence: true
    validates :content, presence: true, length: { maximum: 1000 }
    validates :place, presence: true, length: { maximum: 50 }
end
