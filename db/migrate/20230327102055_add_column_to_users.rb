class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :has_submitted_test, :boolean, default: false
  end
end
