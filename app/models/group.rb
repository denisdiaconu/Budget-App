class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, dependent: :destroy

  validates_format_of :icon,
                      with: /\.(gif|jpg|png)\z/i,
                      message: 'must have an image extension'
end
