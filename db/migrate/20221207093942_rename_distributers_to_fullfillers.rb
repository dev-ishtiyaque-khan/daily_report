# frozen_string_literal: true

# Migration class to rename distributers to fullfillers
class RenameDistributersToFullfillers < ActiveRecord::Migration[7.0]
  def change
    rename_table :distributers, :fullfillers
  end
end
