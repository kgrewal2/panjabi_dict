class AddContributionsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :contributions, :int
  end
end
