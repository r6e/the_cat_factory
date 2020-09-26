class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats, id: :uuid do |t|
      t.text :image_url, null: false
      t.integer :score, null: false, default: 0

      t.timestamps
    end
  end
end
