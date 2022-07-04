class Post < ApplicationRecord
    acts_as_votable
    has_one_attached :image
    has_many :comments, dependent: :destroy
end
