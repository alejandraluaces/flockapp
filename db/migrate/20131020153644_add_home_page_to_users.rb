class AddHomePageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :homepage, :string
  end
end
