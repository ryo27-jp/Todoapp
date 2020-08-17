class User < ApplicationRecord
  has_secure_password
  has_many :todos
  has_many :categories

  has_many :viewers, class_name: "User",
                    foreign_key: "editor_id"
  belongs_to :editor, class_name: "User", optional: true
end
