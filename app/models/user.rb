class User < ActiveRecord::Base
  default_scope { where(company_id: [Company.current_id, nil])}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
end
