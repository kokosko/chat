class FixMessages < ActiveRecord::Migration
  def change
    add_column :messages, :username, :string
    add_column :messages, :city, :string
    add_column :messages, :approved, :boolean
    remove_column :messages, :user_id, :integer
  end
end
