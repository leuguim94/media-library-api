# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  plot       :string
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :season do
    title { 'Breaking Bad' }
    plot { 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future.' }
    number { 1 }
  end
end
