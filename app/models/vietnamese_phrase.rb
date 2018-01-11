class VietnamesePhrase < ApplicationRecord
    belongs_to :chinese_phrase
    has_one :chinese_post, through: :chinese_phrase

    has_many :rates
    has_many :users, through: :rates

    belongs_to :user

    validates :content, presence: true, uniqueness: true
    validates :chinese_phrase_id, presence: true
    validates :user, presence: true

    def order_priority
        rates.count * score
    end
end
