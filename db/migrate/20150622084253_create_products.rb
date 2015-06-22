class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.boolean :is_online, default: false
      t.boolean :isdeleted, default: false
      t.string :productimage

      t.timestamps null: false
    end
  end
end
