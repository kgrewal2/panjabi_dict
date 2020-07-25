class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.text :meaning
      t.text :usage
      t.integer :score

      t.timestamps
    end
  end
end
