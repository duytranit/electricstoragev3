class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :invoice_id
      t.integer :project_id

      t.timestamps
    end
  end
end
