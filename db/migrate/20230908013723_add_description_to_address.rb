class AddDescriptionToAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :description, :string, limit: 30, null:false
  end
end
