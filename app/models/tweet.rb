class Tweet < ApplicationRecord
    belongs_to :user
    validates :content, presence: true
                        slength: { maximum: 140 }
end
