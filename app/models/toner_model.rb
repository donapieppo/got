class TonerModel < ActiveRecord::Base
  belongs_to :vendor
  has_and_belongs_to_many :printer_models

  validates :name, uniqueness: { scope: [:vendor_id], message: "un toner di questa marca con questo nome esiste già." }

  default_scope { includes(:vendor).order('vendors.name, toner_models.name') }

  before_validation :upcase_name

  def to_s
    self.vendor.name + " " + self.name
  end

  def name_with_vendor
    "#{self.name} (#{self.vendor.name})"
  end

  def upcase_name
    self.name.upcase!
  end

  # reorder needed because of default_scope vendor
  def printers(organization)
    Printer.where(organization: organization).where(printer_model: self.printer_models.reorder(:name))
  end
end

