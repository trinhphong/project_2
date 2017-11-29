class ChinesePost < ApplicationRecord
    has_many :chinese_phrases, class_name: "chinese_phrase", dependent: :destroy
    belongs_to :admin, foreign_key: "admin_id"
end