class AddConfirmedToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :confirmed, :boolean, default: false
  end
end
