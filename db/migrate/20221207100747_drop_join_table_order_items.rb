# frozen_string_literal: true

# Migration class to drop join table of orders and items
class DropJoinTableOrderItems < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :orders, :products
  end
end
