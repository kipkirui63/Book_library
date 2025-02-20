class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sessions, dependent: :destroy

  
  has_many :borrowings
  has_many :users, through: :borrowings
  has_many :borrowed_books, through: :borrowings, source: :book

  normalizes :email, with: ->(e) { e.strip.downcase }
end


