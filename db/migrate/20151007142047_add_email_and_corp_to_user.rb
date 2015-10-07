class AddEmailAndCorpToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :corp, :string
  end
end
