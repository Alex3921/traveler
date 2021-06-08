class ChangePostToReview < ActiveRecord::Migration[6.0]
  def up
    rename_table :posts, :reviews
  end

  def down
    rename_table :reviews, :posts
  end
end
