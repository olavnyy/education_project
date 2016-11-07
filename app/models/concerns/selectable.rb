module Selectable
  extend ActiveSupport::Concern

  included do
    QUERY = "(imageable_type = 'School' AND imageable_id = :school_id)
            OR (imageable_type = 'Level' AND imageable_id IN (:level_ids))
            OR (imageable_type = 'Group' AND imageable_id IN (:group_ids))"
  end

end
