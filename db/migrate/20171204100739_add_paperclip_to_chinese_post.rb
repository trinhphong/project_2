class AddPaperclipToChinesePost < ActiveRecord::Migration[5.1]
  def up
    add_attachment :chinese_posts, :image
  end

  def down
    remove_attachment :chinese_posts, :image
  end
end
