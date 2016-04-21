class Admin < ActiveRecord::Base
  extend DmCommon::UserUpnMethods::ClassMethods

  belongs_to_dsa_user :user
  belongs_to :organization

  def to_s
    self.user
  end
end

