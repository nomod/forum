class Post < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :header
      t.string :content
      t.string :login
      t.string :user_ip

      t.timestamps
    end
  end
end
