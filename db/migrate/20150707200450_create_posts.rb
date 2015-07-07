class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |post|
      post.string :posttitle
      post.string :posttext

      post.timestamps
    end
  end
end
