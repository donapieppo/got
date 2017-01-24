class PrinterModel < ApplicationRecord
  has_many :printers
  belongs_to :vendor
  has_and_belongs_to_many :toner_models

  validates :name, presence: {}
  validates :name, uniqueness: { scope: [:vendor_id], message: "Una stampante di questa marca con questo nome esiste già." }

  default_scope { includes(:vendor).order('vendors.name, printer_models.name') }

  def to_s
    self.vendor.name + " " + self.name
  end

  def name_with_vendor
    "#{self.name} (#{self.vendor.name})"
  end

  def self.with_gift_toner
    gift_toner_model_ids = Toner.where(gift: true).select(:toner_model_id).map(&:toner_model_id)
    PrinterModel.includes(:toner_models).where('toner_models.id': gift_toner_model_ids)
  end
end

