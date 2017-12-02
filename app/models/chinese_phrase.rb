class ChinesePhrase < ApplicationRecord
    belongs_to :chinese_post, foreign_key: "chinese_post_id"
    has_many :vietnamese_phrases, dependent: :destroy
end
