class AddBookPdfToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :book_pdf, :string
  end
end
