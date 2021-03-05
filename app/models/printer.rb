class Printer < ApplicationRecord
  belongs_to :organization
  belongs_to :printer_model

  validates :name, presence: {}
  validates :name, uniqueness: { scope: [:organization_id], message: 'La stampante è già stata registrata nella struttura.' }

  validates :organization, presence: {}
  validates :printer_model, presence: {}

  def to_s
    self.name + " (#{self.printer_model})"
  end

  # hostname without domain
  def short_name
    self.name.gsub(/\..*$/, '')
  end

  def vendor
    self.printer_model&.vendor
  end

  def toner_models
    self.printer_model.toner_models
  end
end
