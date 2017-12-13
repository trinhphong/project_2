class ChinesePost < ApplicationRecord
    has_many :chinese_phrases, dependent: :destroy
    has_many :vietnamese_phrases, through: :chinese_phrases
    has_many :rates, through: :vietnamese_phrases
    belongs_to :user, foreign_key: "admin_id"

    has_attached_file :image, styles: {large: "500x200" }
    validates :image
    do_not_validate_attachment_file_type :image
end