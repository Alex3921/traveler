class AddLocationIdToAttraction < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :location_id, :integer
  end
end
