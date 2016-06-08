class User < ActiveRecord::Base
  devise :omniauthable

  include DmUniboCommon::User

  has_many :admins
  has_many :organizations, through: :admins
end

