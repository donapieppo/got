class Vendor < ActiveRecord::Base
  has_many :printer_models, dependent: :restrict_with_error 
  has_many :toner_models, dependent: :restrict_with_error 

  scope :with_printer_models, -> { where("id IN (SELECT DISTINCT(vendor_id) FROM printer_models)") }

  def to_s
    self.name
  end
end
