class AddAdminToChinesePost < ActiveRecord::Migration[5.1]
  def change
    add_reference :chinese_posts, :admin, index: true
  end
end