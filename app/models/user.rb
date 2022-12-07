class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations, dependent: :destroy

  has_many :user_part_relations, dependent: :delete_all
  has_many :parts, through: :user_part_relations
  has_many :likes, dependent: :destroy

  mount_uploader :image, ImageUploader

  def liked_by?(event_id)
    likes.where(event_id: event_id).exists?
  end

end
