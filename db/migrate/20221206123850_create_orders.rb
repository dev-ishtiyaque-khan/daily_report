# frozen_string_literal: true

# Order table logic for migration
class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.integer :amount_filed
      t.references :user, null: false, foreign_key: true
      t.references :distributer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
