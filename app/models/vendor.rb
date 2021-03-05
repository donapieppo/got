class Vendor < ApplicationRecord
  has_many :printer_models
  has_many :toner_models

  validates :name, uniqueness: {}
  scope :with_printer_models, -> { where('id IN (SELECT DISTINCT(vendor_id) FROM printer_models)') }
  scope :with_toner_models,   -> { where('id IN (SELECT DISTINCT(vendor_id) FROM toner_models)') }

  def to_s
    self.name
  end
end
