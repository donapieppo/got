class Admin < ActiveRecord::Base
  extend DmCommon::UserUpnMethods::ClassMethods

  belongs_to_dsa_user :user
  belongs_to :organization

  validates :organization_id, uniqueness: {scope: :user_id}

  def to_s
    self.user
  end
end

