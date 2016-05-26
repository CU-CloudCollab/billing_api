class AwsAccounts < ActiveRecord::Base
  belongs_to :billing_detail, class_name: "BillingDetail", primary_key: "linked_account_id", foreign_key: "account_number"

end
