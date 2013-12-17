class BunchType < ActiveRecord::Base
  validates :name, presence: true
  has_many :fields, class_name: "BunchField"
  has_many :polls
  accepts_nested_attributes_for :fields, allow_destroy: true

  default_scope { where(company_id: Company.current_id) }

  def self.names_bunch
    ["Contact Info", "Motivation letter", "Personal Info", "Job", "Accounts", "Extra uploads"]
  end
end
