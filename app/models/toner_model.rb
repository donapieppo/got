class TonerModel < ApplicationRecord
  belongs_to :vendor
  has_many :toners
  has_and_belongs_to_many :printer_models

  validates :name, presence: {}
  validates :name, uniqueness: { scope: [:vendor_id], message: "Un toner di questa marca con questo nome esiste già." }

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
  def printers(organization = nil)
    res = Printer.where(printer_model: self.printer_models.reorder(:name))
    res = res.where(organization: organization) if organization
    res
  end
end

