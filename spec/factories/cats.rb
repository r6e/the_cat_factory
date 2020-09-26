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
FactoryBot.define do
  factory :cat do
    image_url { Faker::LoremPixel.image(size: '640x480', is_gray: false, category: 'cats') }
    score { Faker::Number.within(range: -100..200) }
  end
end
