class CreateCurrentMonth < ActiveRecord::Migration
  def change
    create_table :current_month, :id => false do |t|
      t.string "invoice_id",        limit: 25
      t.string "payer_account_id",  limit: 25
      t.string "linked_account_id", limit: 25
      t.string "record_type",       limit: 50
      t.string "record_id",         limit: 100
      t.string "product_name",      limit: 100
      t.string "rate_id",           limit: 25
      t.string "subscription_id",   limit: 25
      t.string "pricing_plan_id",   limit: 25
      t.string "usage_type",        limit: 255
      t.string "operation",         limit: 100
      t.string "availability_zone", limit: 25
      t.string "reserved_instance", limit: 255
      t.string "item_description",  limit: 255
      t.string "usage_start_date",  limit: 255
      t.string "usage_end_date",    limit: 255
      t.string "usage_quantity",    limit: 255
      t.string "blended_rate",      limit: 255
      t.string "blended_cost",      limit: 255
      t.string "unblended_rate",    limit: 255
      t.string "unblended_cost",    limit: 255
      t.string "resource_id",       limit: 100
      t.string "cost_center",       limit: 255
    end
  end
end
