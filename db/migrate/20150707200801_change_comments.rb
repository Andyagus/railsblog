class ChangeComments < ActiveRecord::Migration
  def change
   add_column :comments, :commenttext, :string
   add_column :comments, :user_id, :integer
  end
end
