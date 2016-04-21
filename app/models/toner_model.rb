class TonerModel < ActiveRecord::Base
  belongs_to :vendor
  has_and_belongs_to_many :printer_models, through: :printers_toners

  validates :name, uniqueness: { scope: [:vendor_id], message: "un toner di questa marca con questo nome esiste già." }

  def to_s
    self.vendor.name + " " + self.name
  end

  def name_with_vendor
    "#{self.name} (#{self.vendor.name})"
  end
end

