class AddNameToWorkspaces < ActiveRecord::Migration[7.2]
  def change
    add_column :workspaces, :name, :string
  end
end
