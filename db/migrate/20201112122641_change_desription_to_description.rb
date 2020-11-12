class ChangeDesriptionToDescription < ActiveRecord::Migration[6.0]
  def change
    rename_column :doses, :desription, :description
  end
end
