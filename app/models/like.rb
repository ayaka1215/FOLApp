class Like < ApplicationRecord
    validates_uniqueness_of :event_id, scope: :user_id
end
