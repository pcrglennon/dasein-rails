class ChangeAdminsColumnNameToUsername < ActiveRecord::Migration
  def change
    rename_column :admins, :name, :username
  end
end
