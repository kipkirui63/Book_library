class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true

  scope :active, -> { where(returned_at: nil) }
  def returned?
    returned_at.present?
  end
end
