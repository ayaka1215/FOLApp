class Event < ApplicationRecord
    has_many :reservations, dependent: :destroy
    has_many :likes, dependent: :destroy

    validates :title, presence: true, length: { maximum: 40 }
    validates :date, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true, comparison: { greater_than: :start_time }
    validates :content, presence: true, length: { maximum: 1000 }
    validates :place, presence: true, length: { maximum: 50 }
    mount_uploader :image, ImageUploader
   
end
