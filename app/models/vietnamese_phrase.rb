class VietnamesePhrase < ApplicationRecord
    belongs_to :chinese_phrase

    has_many :rates
    has_many :users, through: :rates
end
