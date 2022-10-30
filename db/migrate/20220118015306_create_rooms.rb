class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :introduction, null: false
      t.column :price, 'integer unsigned', null:false
      t.string :address, null: false

      t.timestamps
    end
  end
end
