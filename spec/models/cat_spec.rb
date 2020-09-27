# == Schema Information
#
# Table name: cats
#
#  id         :uuid             not null, primary key
#  score      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'has a score' do
    expect(described_class.new.score).to be_zero
  end
end
