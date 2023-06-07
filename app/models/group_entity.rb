class GroupEntity < ApplicationRecord
  belongs_to :group, foreign_key: 'group_id'
  belongs_to :entity, foreign_key: 'entity_id'
end
