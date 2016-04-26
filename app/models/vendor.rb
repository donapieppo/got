class Vendor < ActiveRecord::Base
  has_many :printer_models, dependent: :restrict_with_error 
  has_many :toner_models, dependent: :restrict_with_error 

  def to_s
    self.name
  end
end
