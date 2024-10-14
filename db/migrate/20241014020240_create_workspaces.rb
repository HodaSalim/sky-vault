class CreateWorkspaces < ActiveRecord::Migration[7.2]
  def change
    create_table :workspaces do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.boolean :is_shared, default: false

      t.timestamps
    end
  end
end
