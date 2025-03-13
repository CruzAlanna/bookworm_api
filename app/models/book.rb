class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :description, presence: true
  validates :pages, numericality: { greater_than_or_equal_to: 1 }
end
