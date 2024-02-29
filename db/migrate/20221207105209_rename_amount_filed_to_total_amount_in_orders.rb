# frozen_string_literal: true

# Migration class to rename amount filed column to total amount in orders
class RenameAmountFiledToTotalAmountInOrders < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :amount_filed, :total_amount
  end
end
