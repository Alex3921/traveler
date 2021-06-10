class AddUseridColOnAttractions < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :user_id, :integer
  end
end
