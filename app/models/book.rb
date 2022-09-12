class Book < ApplicationRecord
  mount_uploader :book_image, BookImageUploader
  mount_uploader :book_pdf, BookPdfUploader 
  # scope :with_long_title, -> { where("LENGTH(title) < 5") }


  has_many :shares , dependent: :destroy 
  belongs_to :user 
  validates :title, :book_pdf, :book_image, presence: true
end
