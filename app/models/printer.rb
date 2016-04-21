class Printer < ActiveRecord::Base
  belongs_to :organization
  belongs_to :printer_model

  def to_s
    self.name + " (#{self.printer_model})"
  end
end

