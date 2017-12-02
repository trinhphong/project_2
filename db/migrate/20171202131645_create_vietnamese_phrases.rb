class CreateVietnamesePhrases < ActiveRecord::Migration[5.1]
  def change
    create_table :vietnamese_phrases do |t|
      t.string :content
      t.references :chinese_phrase

      t.timestamps
    end
  end
end
