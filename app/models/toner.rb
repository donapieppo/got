class Toner < ActiveRecord::Base
  belongs_to :organization
  belongs_to :toner_model

  def to_s
    self.toner_model
  end

  def compatible_printers
    self.toner_model.printers(self.organization)
  end
end


