class Category < ApplicationRecord
  has_many :todos
  belongs_to :user

  validates :name, presence: true,
  length: { maximum: 10 }
end
