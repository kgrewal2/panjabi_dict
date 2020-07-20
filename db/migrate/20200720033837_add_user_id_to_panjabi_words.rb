class AddUserIdToPanjabiWords < ActiveRecord::Migration[6.0]
  def change
    add_column :panjabi_words, :user_id, :integer
  end
end
