class Toner < ActiveRecord::Base
  belongs_to :organization
  belongs_to :toner_model

  def to_s
    self.toner_model
  end
end


