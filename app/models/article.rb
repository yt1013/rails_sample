class Article < ApplicationRecord
    has_many :comments
    validates :title,
        presence: true,
        uniqueness: true,
        length: { minimum: 5 }

    validates :text,
        presence: true
end
