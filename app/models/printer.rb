class Printer < ActiveRecord::Base
  belongs_to :organization
  belongs_to :printer_model

  validates :name, presence: {}
  validates :name, uniqueness:   { scope: [:organization_id], message: "La stampante è già stata registrata." }

  def to_s
    self.name + " (#{self.printer_model})"
  end

  def vendor
    self.printer_model and self.printer_model.vendor
  end
end

