class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :cost
      t.string :location
      t.text :description
      t.boolean :active
      t.string :category
      t.text :keywords
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
