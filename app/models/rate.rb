class Rate < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :vietnamese_phrase, foreign_key: "vietnamese_phrase_id"
end
