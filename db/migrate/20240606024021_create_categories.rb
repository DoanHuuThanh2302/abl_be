# frozen_string_literal: true

# CreateCategories
class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
