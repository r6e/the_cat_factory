class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats, id: :uuid do |t|
      t.integer :score, null: false, default: 0

      t.timestamps
    end
  end
end
