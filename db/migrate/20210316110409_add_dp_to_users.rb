class AddDpToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :dp, :image
  end
end
