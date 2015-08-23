class CreateBillingDetail < ActiveRecord::Migration
  def change
    create_table :billing_detail, :id => false do |t|
      t.string   "invoice_id",        limit: 255
      t.string   "payer_account_id",  limit: 255
      t.string   "linked_account_id", limit: 255
      t.string   "record_type",       limit: 255
      t.string   "record_id",         limit: 255
      t.string   "product_name",      limit: 255
      t.string   "rate_id",           limit: 255
      t.string   "subscription_id",   limit: 255
      t.string   "pricing_plan_id",   limit: 255
      t.string   "usage_type",        limit: 255
      t.string   "operation",         limit: 255
      t.string   "availability_zone", limit: 255
      t.string   "reserved_instance", limit: 255
      t.string   "item_description",  limit: 255
      t.datetime "usage_start_date"
      t.datetime "usage_end_date"
      t.float    "usage_quantity",    limit: 24
      t.float    "blended_rate",      limit: 24
      t.float    "blended_cost",      limit: 24
      t.float    "unblended_rate",    limit: 24
      t.float    "unblended_cost",    limit: 24
      t.string   "resource_id",       limit: 255
      t.string   "cost_center",       limit: 255

    end
  end
end
