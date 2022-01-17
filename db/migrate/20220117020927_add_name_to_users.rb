class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, :null => false
    add_column :users, :introduction, :string
    add_column :users, :profile_img_path, :string
  end
end
