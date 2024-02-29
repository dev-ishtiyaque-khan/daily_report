# frozen_string_literal: true

# Migration class to rename join table of product and fullfiller
class RenameJoinTableProductDistributer < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :products, :distributers
    create_join_table :fullfillers, :products do |t|
      t.index %i[product_id fullfiller_id]
    end
  end
end
