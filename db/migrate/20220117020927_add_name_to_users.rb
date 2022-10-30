class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :introduction, :string
    change_column :users, :name, :string, :null => false
  end
end
