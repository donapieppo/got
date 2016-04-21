class Organization < ActiveRecord::Base
  has_many :admins
  has_many :printers
  has_many :toners

  validates :name, uniqueness: {}

  def to_s
    self.name + " (" + self.description + ")"
  end
end
