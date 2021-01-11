class Comment < ApplicationRecord
  # リレーション
  belongs_to :article

  # バリデーション
  validates :commenter,
    presence: true
  
  validates :body,
    presence: true
end
