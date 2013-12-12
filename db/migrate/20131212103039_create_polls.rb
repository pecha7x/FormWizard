class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :bunches_type_id
      t.text :properties

      t.timestamps
    end
  end
end
