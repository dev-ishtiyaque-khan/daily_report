# frozen_string_literal: true

# Migration class to change total amount column to decimal in Order table
class ChangeTotalAmountToDecimalInOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :total_amount, :decimal
  end
end
