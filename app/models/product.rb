# frozen_string_literal: true

class Product < ApplicationRecord
  has_and_belongs_to_many :fullfillers
  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
end
