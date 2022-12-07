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

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
  
end
