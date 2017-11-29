class CreateChinesePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :chinese_posts do |t|
      t.title :string
      t.content :text
      t.source :string

      t.timestamps
    end
  end
end
