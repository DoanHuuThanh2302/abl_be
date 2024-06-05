# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :rank, null: false, foreign_key: true
      t.references :starting_price, null: false, foreign_key: true
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.text :description
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
