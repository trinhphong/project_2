class CreateChinesePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :chinese_posts do |t|
      t.string :title
      t.text :content
      t.string :source

      t.timestamps
    end
  end
end
