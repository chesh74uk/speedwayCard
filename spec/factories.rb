FactoryBot.define do
  
  factory :meeting do
    date Faker::Date.forward(23)
    home_team Faker::Team.name
    away_team Faker::Team.name
  end
  
end