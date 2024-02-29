# frozen_string_literal: true

class Fullfiller < ApplicationRecord
  has_many :orders

  validates :name, presence: true, uniqueness: true
end
