class CreateChinesePhrases < ActiveRecord::Migration[5.1]
  def change
    create_table :chinese_phrases do |t|
      t.text :content
      t.belongs_to :chinese_post, foreign_key: "chinese_post_id"

      t.timestamps
    end
  end
end
