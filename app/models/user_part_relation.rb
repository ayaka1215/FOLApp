class UserPartRelation < ApplicationRecord
  belongs_to :user
  belongs_to :part
end
