# frozen_string_literal: true

# Join table migration for Orders and Products
class CreateJoinTableOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :products do |t|
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity, default: 1
      t.index %i[order_id product_id]
    end
  end
end
