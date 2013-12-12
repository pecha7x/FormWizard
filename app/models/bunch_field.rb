class BunchField < ActiveRecord::Base
  belongs_to :bunch_type
  validates :name, presence: true
end
