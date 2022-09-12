class Share < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validates :book_id, presence: true, uniqueness: { scope: :user_id }
  validate :same_user

  private 

  def same_user
      # b=book1.user_id
      # a=self.user_id
      book1 = self.book

      if book1.user_id == self.user_id  
        errors.add :user_id, 'Can not Share book byself'
      end
  end
end
