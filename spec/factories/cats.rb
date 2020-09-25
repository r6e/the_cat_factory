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
FactoryBot.define do
  factory :cat do
    image_url { "MyText" }
    score { 1 }
  end
end
