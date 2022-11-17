class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # ユーザー自身でアカウント作成不可
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations, dependent: :destroy

  # partsテーブル関連
  has_many :user_part_relations, dependent: :delete_all
  has_many :parts, through: :user_part_relations

  mount_uploader :image, ImageUploader
end
