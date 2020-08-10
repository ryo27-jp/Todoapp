class AddEditerIdToUsers < ActiveRecord::Migration[5.2]
  def up
    add_reference :users, :editor
  end

  def down
    remove_reference :users, :editor
  end
end
