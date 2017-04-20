# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  track_type :string           not null
#  title      :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  TRACK_TYPES = %w(Regular Bonus)
  validates :album_id, :track_type, :title, presence: true
  validates :track_type, inclusion: {in: TRACK_TYPES}
  validates :title, uniqueness: { scope: :album_id }

  belongs_to :album
  has_one :band, through: :album, source: :band
end
