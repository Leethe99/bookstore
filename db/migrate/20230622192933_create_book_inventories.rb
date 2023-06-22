class CreateBookInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :book_inventories do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.text :description

      t.timestamps
    end
  end
end
