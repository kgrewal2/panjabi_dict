class AddLanguageToTranslations < ActiveRecord::Migration[6.0]
  def change
    add_column :translations, :language, :integer
  end
end
