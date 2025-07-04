class Comments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
