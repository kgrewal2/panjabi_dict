class AddUserTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_type, :int
  end
end
