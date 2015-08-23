class CreateUserAccount < ActiveRecord::Migration
  def change
    create_table :user_account do |t|
      t.integer :user_id
      t.string :account_num

      t.timestamps null: false
    end
  end
end
