class CurrentMonth < ActiveRecord::Base
   scope :linked_account, -> (id) { where(linked_account_id:id) }
end
