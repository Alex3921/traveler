class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :attraction_id
      t.timestamps
    end
  end
end
