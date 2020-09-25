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
require 'rails_helper'

RSpec.describe Cat, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
