# frozen_string_literal: true

# CreateRanks
class CreateRanks < ActiveRecord::Migration[7.1]
  def change
    create_table :ranks do |t|
      t.string :name
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
