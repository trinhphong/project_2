class ChinesePost < ApplicationRecord
    has_many :chinese_phrases, dependent: :destroy
    belongs_to :admin, foreign_key: "admin_id"

    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates :image, attachment_presence: true
    validates_attachment :image, size: { in: 0..100.kilobytes }
    validates_attachment :image, content_type: { content_type: "image/jpg" }
end