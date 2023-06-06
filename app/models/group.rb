class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :group_entities, dependent: :destroy
  has_many :entities, through: :group_entities
  
  validates :name, presence: true
  validates :icon, presence: true
end
