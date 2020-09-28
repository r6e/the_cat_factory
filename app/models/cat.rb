# == Schema Information
#
# Table name: cats
#
#  id         :uuid             not null, primary key
#  score      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cat < ApplicationRecord
  has_one_attached :image

  # Our generator only supports 256x256 PNG images. Ensure we don't accidentally create any others
  validates :image, attached: true, content_type: :png, dimension: { width: 256, height: 256 }
end
