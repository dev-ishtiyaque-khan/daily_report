# frozen_string_literal: true

# Migration logic to update references in orders
class UpdateReferencesInOrders < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :distributer
    add_reference :orders, :fullfiller, null: false, foreign_key: true
  end
end
