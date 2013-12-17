class Poll < ActiveRecord::Base
  belongs_to :bunch_type
  serialize :properties, Hash

  validate :validate_properties

  default_scope { where(company_id: Company.current_id) }

  def validate_properties
    bunch_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end
  end
end
