class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :index

      t.timestamps
    end
  end
end
