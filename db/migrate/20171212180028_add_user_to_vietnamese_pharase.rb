class AddUserToVietnamesePharase < ActiveRecord::Migration[5.1]
  def change
    add_reference :vietnamese_phrases, :user, index: true
  end
end
