class Toner < ApplicationRecord
  belongs_to :organization
  belongs_to :toner_model

  validates :organization, presence: {}
  validates :toner_model, presence: {}
  validates :number, numericality: { greater_than: 0 }

  def to_s
    self.toner_model
  end

  def compatible_printers
    self.toner_model.printers(self.organization)
  end

  def printer_models
    self.toner_model.printer_models
  end

  def vendor
    self.toner_model&.vendor
  end
end
