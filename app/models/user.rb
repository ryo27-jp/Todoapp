class User < ApplicationRecord
  has_secure_password
  has_many :todos

  has_many :viwers, class_name: "User",
                    foreign_key: "editor_id"
  belongs_to :edotor, class_name "User", optional: true
end
