class CreateUser < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :api_key
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
