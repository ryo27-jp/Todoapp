class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, limit: 10

      t.timestamps
    end
  end
end
