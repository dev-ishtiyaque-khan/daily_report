# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :price, numericality: { greater_than: 0 }

  scope :given_day_sales, ->(date = Date.today) { where(created_at: date.beginning_of_day..date.end_of_day) }
end
