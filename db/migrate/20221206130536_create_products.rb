# frozen_string_literal: true

# Product table logic for migration
class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
