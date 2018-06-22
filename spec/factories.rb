FactoryBot.define do
  
  factory :meeting do
    date {  Faker::Date.forward(23) }
    home_team { Faker::Team.name }
    away_team { Faker::Team.name }
    home_rider_1 { Faker::Name.name }
    home_rider_2 { Faker::Name.name }
    home_rider_3 { Faker::Name.name }
    home_rider_4 { Faker::Name.name }
    home_rider_5 { Faker::Name.name }
    home_rider_6 { Faker::Name.name }
    home_rider_7 { Faker::Name.name }
    away_rider_1 { Faker::Name.name }
    away_rider_2 { Faker::Name.name }
    away_rider_3 { Faker::Name.name }
    away_rider_4 { Faker::Name.name }
    away_rider_5 { Faker::Name.name }
    away_rider_6 { Faker::Name.name }
    away_rider_7 { Faker::Name.name }
  end
  
  factory :heat do
    heat_time 59.87
    heat_number 11
    association :meeting
  end
  
  factory :blue do
    gate_number 1
    rider_name { Faker::Name.name }
    score 3
    association :heat
  end
  
  factory :red do
    gate_number 3
    rider_name { Faker::Name.name }
    score 2
    association :heat
  end
  
  factory :white do
    gate_number 2
    rider_name { Faker::Name.name }
    score 1
    association :heat
  end
  
  factory :yellow do
    gate_number 2
    rider_name {Faker::Name.name}
    score 0
    association :heat
  end
  

end