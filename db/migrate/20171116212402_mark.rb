class Mark < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.integer :value
      t.integer :post_id
      t.integer :login

      t.timestamps
    end
  end
end
