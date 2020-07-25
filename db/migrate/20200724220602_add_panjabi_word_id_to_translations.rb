class AddPanjabiWordIdToTranslations < ActiveRecord::Migration[6.0]
  def change
    add_column :translations, :panjabi_word_id, :integer
  end
end
