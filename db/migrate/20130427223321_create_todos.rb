class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.integer :list_id
      t.boolean :completed, default: false


      t.timestamps
    end

    add_index :todos, :list_id
  end
end
