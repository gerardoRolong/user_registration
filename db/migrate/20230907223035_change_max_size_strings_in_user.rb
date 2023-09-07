class ChangeMaxSizeStringsInUser < ActiveRecord::Migration[7.0]
  def change
    change_column :user, :first_name, :string, limit: 30, null: false
    change_column :user, :last_name, :string, limit: 30, null: false
    change_column :user, :emal, :string, limit: 30, null: false
    change_column :user, :birth_date, null: false
    change_column :user, :gender, null: false
  end
end
