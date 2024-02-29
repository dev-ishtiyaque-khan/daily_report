# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :fullfiller
  has_many :order_items
  has_many :products, through: :order_items

  enum :status, %i[not_fullfilled fullfilled]

  validates :total_amount, numericality: { greater_than: 0 }
  scope :given_day_entries, ->(date = Date.today) { where(created_at: date.beginning_of_day..date.end_of_day) }
  accepts_nested_attributes_for :order_items, allow_destroy: true
end
