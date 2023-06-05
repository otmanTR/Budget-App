class Group < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    has_many :entities, through: :group_entites

    validates :name, presence: true
    validates :icon, presence: true
end
