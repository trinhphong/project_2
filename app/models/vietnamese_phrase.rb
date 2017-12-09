class VietnamesePhrase < ApplicationRecord
    belongs_to :chinese_phrase
    has_one :chinese_post, through: :chinese_phrase

    has_many :rates
    has_many :users, through: :rates

    validates :content, presence: true, uniqueness: true
    validates :chinese_phrase_id, presence: true
end
