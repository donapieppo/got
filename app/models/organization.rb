class Organization < ActiveRecord::Base
  has_many :admins
  has_many :printers
  has_many :toners

  validates :name, uniqueness: {}

  # cache
  attr_accessor :_printer_model_ids, 
                :_usable_toner_models

  def to_s
    self.name + " (" + self.description + ")"
  end

  def short_description
    "#{self.name} - #{self.description[0..70]}"
  end

  def admins_string
    self.admins.map {|admin| admin.to_s}.join(', ')
  end

  def printer_model_ids
    @_printer_model_ids ||= self.printers.select(:printer_model_id).map(&:printer_model_id).uniq
  end

  def usable_toner_models
    @_usable_toner_models ||= TonerModel.includes(:printer_models).where('printer_models_toner_models.printer_model_id': printer_model_ids)
  end

  # toners (in tutte organizations) for my printers
  def available_toners
    Toner.where(toner_model: usable_toner_models.map(&:id)).where(gift: true)
  end

  def interested_in?(toner)
    usable_toner_models.map(&:id).include?(toner.toner_model_id)
  end
end
