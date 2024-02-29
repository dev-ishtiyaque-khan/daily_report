# frozen_string_literal: true

class User < ApplicationRecord
  has_many :orders

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
