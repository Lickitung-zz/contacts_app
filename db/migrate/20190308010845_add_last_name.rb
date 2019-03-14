class AddLastName < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :last_name, :string
  end
end
