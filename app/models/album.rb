# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_type :string           not null
#

class Album < ApplicationRecord
  ALBUM_TYPES = %w(Live Studio)

  validates :title, :band_id, :album_type, presence: true
  validates :album_type, inclusion: {in: ALBUM_TYPES}
  validates :title, uniqueness: { scope: :band_id,
    message: "Single band cannot have two albums of the same name"}

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
