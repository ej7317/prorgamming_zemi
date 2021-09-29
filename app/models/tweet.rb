class Tweet < ApplicationRecord
    belongs_to :user
    validates :content, presence: true
<<<<<<< HEAD
                        slength: { maximum: 140 }
=======
                        length: { maximum: 140 }
>>>>>>> 1e326ce2cd9d17b4e23b158fc29347e93ad056a0
end
