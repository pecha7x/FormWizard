class CreateBunchFields < ActiveRecord::Migration
  def change
    create_table :bunch_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :bunch_type

      t.timestamps
    end
    add_index :bunch_fields, :bunch_type_id
  end
end
