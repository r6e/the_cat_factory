# == Schema Information
#
# Table name: cats
#
#  id         :uuid             not null, primary key
#  score      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatSerializer < BaseSerializer
  attribute :score
  attribute(:image) { |cat| cat.image.service_url }
end
