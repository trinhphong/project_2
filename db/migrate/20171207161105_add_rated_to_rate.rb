class AddRatedToRate < ActiveRecord::Migration[5.1]
  def change
    add_column :rates, :rated, :boolean, default: false
  end
end
