class Organization < ActiveRecord::Base
  has_many :admins
  has_many :printers
  has_many :toners

  validates :name, uniqueness: {}

  attr_accessor :_printer_model_ids, :_toner_models

  def to_s
    self.name + " (" + self.description + ")"
  end

  def short_description
    "#{self.name} - #{self.description[0..70]}"
  end

  def printer_model_ids
    @_printer_model_ids ||= self.printers.map(&:printer_model_id).uniq
  end

  def toner_models
    @_toner_models ||= TonerModel.includes(:printer_models).where('printer_models_toner_models.printer_model_id': printer_model_ids)
  end

  # toners (in tutte organizations) for my printers
  def available_toners
    Toner.where(toner_model: toner_models.map(&:id)).where(gift: true)
  end

  def admins_string
    self.admins.map {|admin| admin.to_s}.join(', ')
  end

  def interested?(toner)
    @printer_model_ids ||= self.printers.map(&:printer_model_id)
    (toner.toner_model.printer_model_ids.to_a & @printer_model_ids).size > 0 
  end
end
