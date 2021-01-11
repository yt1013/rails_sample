class Article < ApplicationRecord
    # リレーション
    has_many :comments,
        dependent: :destroy

    # バリデーション
    validates :title,
        presence: true,
        uniqueness: true,
        length: { minimum: 5 }

    validates :text,
        presence: true
end
