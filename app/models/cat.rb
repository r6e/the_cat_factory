# == Schema Information
#
# Table name: cats
#
#  id         :uuid             not null, primary key
#  image_url  :text
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cat < ApplicationRecord
end
