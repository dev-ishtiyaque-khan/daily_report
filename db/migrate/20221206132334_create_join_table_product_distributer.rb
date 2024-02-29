# frozen_string_literal: true

# Join table migration for Product and Distributer
class CreateJoinTableProductDistributer < ActiveRecord::Migration[7.0]
  def change
    create_join_table :products, :distributers do |t|
      t.index %i[product_id distributer_id]
    end
  end
end
