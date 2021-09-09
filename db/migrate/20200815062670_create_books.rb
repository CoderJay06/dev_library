class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.date :release_date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
