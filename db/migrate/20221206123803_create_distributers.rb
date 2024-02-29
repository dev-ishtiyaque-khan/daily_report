# frozen_string_literal: true

# Distributer table logic for migration
class CreateDistributers < ActiveRecord::Migration[7.0]
  def change
    create_table :distributers do |t|
      t.string :name
      t.integer :type

      t.timestamps
    end
  end
end
