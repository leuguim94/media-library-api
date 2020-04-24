class Episode < ApplicationRecord
  belongs_to :season
  
  validates_presence_of :title, :number, :season
  validates_uniqueness_of :number, scope: :season_id
end
