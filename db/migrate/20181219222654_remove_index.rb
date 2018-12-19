class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :cats, :user_id 
    add_index :cats, :user_id
  end
end
