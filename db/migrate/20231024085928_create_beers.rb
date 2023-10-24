class CreateBeers < ActiveRecord::Migration[7.1]
  def change
    create_table :beers do |t|
      t.string :title
      t.string :brand
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
