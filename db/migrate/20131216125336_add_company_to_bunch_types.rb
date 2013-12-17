class AddCompanyToBunchTypes < ActiveRecord::Migration
  def change
    add_column :bunch_types, :company_id, :integer
    add_index :bunch_types, :company_id
  end
end
