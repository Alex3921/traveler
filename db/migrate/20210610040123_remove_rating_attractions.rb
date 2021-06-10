class RemoveRatingAttractions < ActiveRecord::Migration[6.0]
  def change
    remove_column :attractions, :rating
  end
end
