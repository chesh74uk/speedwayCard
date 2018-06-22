FactoryBot.define do
  
  factory :meeting do
    sequence(:date) {  Faker::Date.forward(23) }
    sequence(:home_team) { Faker::Team.name }
    sequence(:away_team) { Faker::Team.name }
  end
  
  factory :heat do
    heat_time 59.87
    heat_number 11
    association :meeting
  end
  

end
