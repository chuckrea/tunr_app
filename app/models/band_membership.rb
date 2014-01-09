class BandMembership < ActiveRecord::Base
  attr_accessible :band_id, :musician_id, :band, :musician

  belongs_to :musician
  belongs_to :band
end
