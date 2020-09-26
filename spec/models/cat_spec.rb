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
require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'validates image_url' do
    expect(described_class.new(image_url: 'http://example.com/some_image.png')).to be_valid
    expect(described_class.new(image_url: 'not a url')).not_to be_valid
  end
end
