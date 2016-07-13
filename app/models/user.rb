class User < ActiveRecord::Base
  include DmUniboCommon::User

  has_many :admins
  has_many :organizations, through: :admins
end

