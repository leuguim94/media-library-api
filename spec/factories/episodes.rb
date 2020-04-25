FactoryBot.define do
  factory :episode do
    factory :episode_1 do
      title { "Breaking Bad 1x01" }
      plot { "Breaking Bad Season 1 Episode 1" }
      season
      number { 1 }
    end

    factory :episode_2 do
      title { "Breaking Bad 1x02" }
      plot { "Breaking Bad Season 1 Episode 2" }
      season
      number { 2 }
    end
    
    factory :episode_3 do
      title { "Breaking Bad 1x03" }
      plot { "Breaking Bad Season 1 Episode 3" }
      season
      number { 3 }
    end
  end
end