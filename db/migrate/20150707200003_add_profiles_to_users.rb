class AddProfilesToUsers < ActiveRecord::Migration
  def change
   add_column :users, :fname, :string
   add_column :users, :lname, :string
   add_column :users, :birthday, :datetime
   add_column :users, :location, :string
  end
end
