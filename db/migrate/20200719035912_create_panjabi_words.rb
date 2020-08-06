class CreatePanjabiWords < ActiveRecord::Migration[6.0]
  def change
    create_table :panjabi_words do |t|
      t.string :gurmukhi
      t.string :shahmukhi
      t.string :roman
      t.string :phonetics
      t.text :anuvaad
      t.text :usage
      t.integer :pos
      t.integer :score
      t.boolean :approved

      t.timestamps
    end
  end
end
