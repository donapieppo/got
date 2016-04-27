class PrinterModel < ActiveRecord::Base
  belongs_to :vendor
  has_and_belongs_to_many :toner_models

  validates :name, uniqueness: { scope: [:vendor_id], message: "Una stampante di questa marca con questo nome esiste già." }

  default_scope { includes(:vendor).order('vendors.name, printer_models.name') }

  def to_s
    self.vendor.name + " " + self.name
  end

  def name_with_vendor
    "#{self.name} (#{self.vendor.name})"
  end
end

