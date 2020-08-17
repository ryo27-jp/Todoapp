class AddUserIdToCategories < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM categories;'
    add_reference :categories, :user, null: false
  end

  def down
    remove_reference :categories, :user
  end
end
