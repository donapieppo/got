class Organization < ActiveRecord::Base
  has_many :admins
  has_many :printers
  has_many :toners

  validates :name, uniqueness: {}

  attr_accessor :printer_model_ids

  def to_s
    self.name + " (" + self.description + ")"
  end

  def short_description
    "#{self.name} - #{self.description[0..70]}"
  end

  # toners (in tutte organizations) for my printers
  # TODO refactor
  def available_toners
    printer_model_ids = self.printers.map(&:printer_model_id).uniq
    toner_models_ids = TonerModel.includes(:printer_models).where('printer_models_toner_models.printer_model_id': printer_model_ids).map(&:id)
    Toner.where(toner_model_id: toner_models_ids).where(gift: true)
  end

  def admins_string
    self.admins.map {|admin| admin.to_s}.join(', ')
  end

  def interested?(toner)
    @printer_model_ids ||= self.printers.map(&:printer_model_id)
    (toner.toner_model.printer_model_ids.to_a & @printer_model_ids).size > 0 
  end
end
