class CreateSubscriptionRules < ActiveRecord::Migration[7.0]
  def change
    create_table :subscription_rules do |t|
      t.references :subscription, null: false, foreign_key: true
      t.string :name
      t.integer :salary_min
      t.integer :salary_max
      t.string :country

      t.timestamps
    end
  end
end
