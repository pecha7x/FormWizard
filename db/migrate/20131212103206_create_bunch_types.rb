class CreateBunchTypes < ActiveRecord::Migration
  def change
    create_table :bunch_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
