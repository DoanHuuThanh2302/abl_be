# frozen_string_literal: true

# CreateStartingPrices
class CreateStartingPrices < ActiveRecord::Migration[7.1]
  def change
    create_table :starting_prices do |t|
      t.string :name
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
