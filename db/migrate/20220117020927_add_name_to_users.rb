class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :introduction, :string
    add_column :users, :img_path, :string
    change_column :users, :name, :string, :null => false
  end
end
