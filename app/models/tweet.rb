class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes
    validates :user_id, presence: true
    validates :content, presence: true, length: { maximum: 140 }
end
