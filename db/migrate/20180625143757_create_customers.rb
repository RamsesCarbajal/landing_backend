class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :comment

      t.timestamps
    end
  end
end
