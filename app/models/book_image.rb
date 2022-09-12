class BookImage < ApplicationRecord
  has_many :shares , dependent: :destroy
  belongs_to :book
end
