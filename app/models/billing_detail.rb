class BillingDetail < ActiveRecord::Base
 has_one :aws_account, class_name: "AwsAccounts", primary_key: "account_number", foreign_key: "linked_account_id"

 scope :linked_account, -> (id) { where(linked_account_id: id) }
 scope :by_month, -> (month) { where("month(usage_start_date) = ?", month) }
 scope :by_year, -> (year) { where("year(usage_start_date) = ?", year) }

end
