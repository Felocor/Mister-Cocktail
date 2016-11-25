class CreateDoses < ActiveRecord::Migration[5.0]
  def change
    create_table :doses do |t|
      t.text :description
      t.references :ingredient
      t.references :cocktail
      t.timestamps
    end
  end
end
