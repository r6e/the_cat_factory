# == Schema Information
#
# Table name: cats
#
#  id         :uuid             not null, primary key
#  score      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :cat do
    score { Faker::Number.within(range: -128..256) }

    after(:build) do |cat|
      filename = "#{Faker::Number.within(range: 0..15)}.png"
      cat.image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'cat_images', filename)),
        filename: filename,
        content_type: Mime[:png].to_s
      )
    end
  end
end
