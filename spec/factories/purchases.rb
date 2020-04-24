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