# == Schema Information
#
# Table name: cats
#
#  id         :uuid             not null, primary key
#  image_url  :text             not null
#  score      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cat < ApplicationRecord
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp }
end
