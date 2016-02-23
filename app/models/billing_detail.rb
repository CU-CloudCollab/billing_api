class BillingDetail < ActiveRecord::Base

 scope :linked_account, -> (id) { where(linked_account_id: id) }
 scope :by_month, -> (month) { where("month(usage_start_date) = ?", month) }
 scope :by_year, -> (year) { where("year(usage_start_date) = ?", year) }

end
