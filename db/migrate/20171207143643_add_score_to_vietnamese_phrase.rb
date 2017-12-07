class AddScoreToVietnamesePhrase < ActiveRecord::Migration[5.1]
  def change
    add_column :vietnamese_phrases, :score, :float, default: 0
  end
end
