# frozen_string_literal: true

# Migration class logic for OrderItems table
class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.decimal :price
      t.integer :quantity, default: 1
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
