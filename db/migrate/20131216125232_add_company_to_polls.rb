class AddCompanyToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :company_id, :integer
    add_index :polls, :company_id
  end
end
