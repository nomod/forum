class AddUniqueInMarks < ActiveRecord::Migration[5.0]
  def change
    add_index :marks, [:post_id, :login], unique: true
  end
end
