# frozen_string_literal: true

# Migration class to change type column to string in Fullfiller table
class ChangeTypeToStringInFullfiller < ActiveRecord::Migration[7.0]
  def change
    change_column :fullfillers, :type, :string
  end
end
