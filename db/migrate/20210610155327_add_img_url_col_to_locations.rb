class AddImgUrlColToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :img_url, :string
  end
end
