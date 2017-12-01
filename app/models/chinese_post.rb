class ChinesePost < ApplicationRecord
    has_many :chinese_phrases
    belongs_to :admin, foreign_key: "admin_id"
end