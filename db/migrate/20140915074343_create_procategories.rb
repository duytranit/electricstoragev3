class CreateProcategories < ActiveRecord::Migration
  def change
    create_table :procategories do |t|
      t.string :name
      t.text :description
      t.string :ddc
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
