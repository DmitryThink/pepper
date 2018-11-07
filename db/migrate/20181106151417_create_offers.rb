class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :name
      t.string :description
      t.float :original_price
      t.float :actual_price
      t.string :url
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
