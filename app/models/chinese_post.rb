class ChinesePost < ApplicationRecord
    has_many :chinese_phrases, dependent: :destroy
    belongs_to :admin, foreign_key: "admin_id"
end