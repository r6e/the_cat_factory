class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats, id: :uuid do |t|
      t.text :image_url
      t.integer :score

      t.timestamps
    end
  end
end
