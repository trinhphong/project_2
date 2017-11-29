class CreateChinesePhrases < ActiveRecord::Migration[5.1]
  def change
    create_table :chinese_phrases do |t|
      t.content :text

      t.timestamps
    end
  end
end
