class Todo < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  validates :name, presence: true,
                   length: { maximum: 30 }
end
