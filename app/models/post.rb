class Post < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: "Post", optional: true
  has_many :posts, foreign_key: :parent_id

  after_create_commit { broadcast_append_to "posts" }
end
