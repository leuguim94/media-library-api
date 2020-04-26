# == Schema Information
#
# Table name: purchases
#
#  id          :integer          not null, primary key
#  movie_id    :integer
#  season_id   :integer
#  user_id     :integer          not null
#  price       :float            not null
#  quality     :integer          not null
#  expire_date :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :purchase do
    factory :purchase_movie do
      movie
      user
      price { 5284.91 }
      quality { 'SD' }
    end

    factory :purchase_season do
      season
      user
      price { 6.00 }
      quality { 'HD' }
    end
  end
end
