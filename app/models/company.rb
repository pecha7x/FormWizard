class Company < ActiveRecord::Base
  after_create :create_bunches

  def create_bunches
    BunchType.names_bunch.each do |bunch_type|
      BunchType.create!(name: bunch_type, company_id: self.id)
    end
  end

  def self.current_id=(id)
    Thread.current[:company_id] = id
  end

  def self.current_id
    Thread.current[:company_id]
  end

  has_many :polls
  has_many :bunch_types
  has_many :users
end
