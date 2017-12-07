class AddScoreToVietnamesePhrase < ActiveRecord::Migration[5.1]
  def change
    add_column :vietnamese_phrases, :score, :float
  end
end
