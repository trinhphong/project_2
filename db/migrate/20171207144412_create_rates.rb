class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.references :user
      t.references :vietnamese_phrase
      t.float :score, default: 0

      t.timestamps
    end
  end
end
