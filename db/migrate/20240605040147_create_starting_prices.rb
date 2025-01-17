# frozen_string_literal: true

# CreateStartingPrices
class CreateStartingPrices < ActiveRecord::Migration[7.1]
  def change
    create_table :starting_prices do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
