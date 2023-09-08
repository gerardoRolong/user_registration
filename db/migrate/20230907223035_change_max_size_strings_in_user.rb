class ChangeMaxSizeStringsInUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :first_name, :string, limit: 30, null: false
    change_column :users, :last_name, :string, limit: 30, null: false
    change_column :users, :email, :string, limit: 30, null: false
    change_column_null :users, :birth_date, false
    change_column_null :users, :gender, false
  end
end
