class Band < ActiveRecord::Base
  attr_accessible :name

  has_many :musicians, through: :band_memberships
  has_many :band_memberships
end
