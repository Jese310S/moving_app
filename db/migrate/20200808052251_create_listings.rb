class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.date :moving_date
      t.time :moving_time
      t.string :price
      t.text :comment
      t.string :image

      t.timestamps
    end
    add_index :listings, [:user_id, :created_at]
  end
end
