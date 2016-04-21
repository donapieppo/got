class User < ActiveRecord::Base
  devise :omniauthable

  include DmCommon::User

  has_many :admins
  has_many :organizations, through: :admins
end

