class ChinesePost < ApplicationRecord
    has_many :chinese_phrases, dependent: :destroy
    belongs_to :admin, foreign_key: "admin_id"

    has_attached_file :image, styles: {large: "500x200" }
    validates :image, attachment_presence: true
    do_not_validate_attachment_file_type :image
end