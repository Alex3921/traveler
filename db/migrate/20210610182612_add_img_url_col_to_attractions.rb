class AddImgUrlColToAttractions < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :img_url, :string
  end
end
