class Vendor < ActiveRecord::Base
  has_many :printers

  def to_s
    self.name
  end
end
