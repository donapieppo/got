class Organization < ApplicationRecord
  include DmUniboCommon::Organization

  has_many :printers
  has_many :toners

  # cache
  attr_accessor :_printer_model_ids,
    :_toner_model_ids,
    :_usable_toner_models,
    :_unusable_toner

  def admins_string
    self.admins.includes(:user).map { |admin| admin.to_s }.join(", ")
  end

  def admins_mail_array
    self.admins.includes(:user).map { |admin| admin.user.upn }
  end

  # me

  def printer_model_ids
    @_printer_model_ids ||= self.printers.select(:printer_model_id).map(&:printer_model_id).uniq
  end

  def toner_model_ids
    @_toner_model_ids ||= self.toners.select(:toner_model_id).map(&:toner_model_id).uniq
  end

  def usable_toner_models
    @_usable_toner_models ||= TonerModel.includes(:printer_models).where("printer_models_toner_models.printer_model_id": printer_model_ids)
  end

  def unusable_toners
    @_unusable_toners ||= self.toners.where.not(toner_model: usable_toner_models.map(&:id))
  end

  # others

  # toners (in tutte organizations) for my printers
  def available_toners
    Toner.where(toner_model: usable_toner_models.map(&:id)).where(gift: true)
  end

  def interested_in?(toner)
    usable_toner_models.map(&:id).include?(toner.toner_model_id)
  end
end
