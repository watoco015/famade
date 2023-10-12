class CreateArts < ActiveRecord::Migration[7.0]
  def change
    create_table :arts do |t|
      t.references :user,         null: false, foreign_key: true
      t.string     :title
      t.text       :content
      t.integer    :category_id,  null: false
      t.integer    :subcategory_id,  null: false

      t.timestamps
    end
  end
end
