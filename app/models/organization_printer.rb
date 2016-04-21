class OrganizationPrinter < ActiveRecord::Base
  has_many :organizations
  has_many :printers

end
