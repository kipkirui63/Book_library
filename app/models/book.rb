class Book < ApplicationRecord
    has_many :borrowings, dependent: :destroy
    
    validates :title, :author, :isbn, presence: true
    validates :isbn, uniqueness: true
  
    def available?
        !borrowings.active.exists?
    end
  end
  