#This file is the playground for checking our code is working.

require_relative( './models/gym' )
require_relative( './models/trainer' )
require_relative( './models/pokemon' )

require( 'pry-byebug' )

gym1 = Gym.new( { 'name' => 'Pewter City Gym', 'city' => 'Pewtar City', 'leader' => 'Brock' } ).save(  )

gym2 = Gym.new( { 'name' => 'Cerulean City Gym', 'city' => 'Cerulean City', 'leader' => 'Misty' } ).save(  )

gym3 = Gym.new( { 'name' => 'Vermillion City Gym', 'city' => 'Vermillion City', 'leader' => 'Lt. Surge' } ).save(  )

trainer1 = Trainer.new( { 'name' => 'Gary Oak', 'discipline' => 'Total bell-end', 'city' => 'Pallet Town', 'gym_id' => gym1.id } ).save(  )

trainer2 = Trainer.new( { 'name' => 'Ash Ketchum,', 'discipline' => 'Main character', 'city' => 'Pallet Town', 'gym_id' => gym2.id } ).save(  )

trainer3 = Trainer.new( { 'name' => 'James,', 'discipline' => 'Team Rocket Jerk', 'city' => 'Nimbasa City', 'gym_id' => gym3.id  } ).save(  )

pokemon1 = Pokemon.new( { 'name' => 'Pickachu,', 'type_one' => 'Electric', 'trainer_id' => trainer2.id  } ).save(  )

pokemon2 = Pokemon.new( { 'name' => 'Squirtal,', 'type_one' => 'Water', 'trainer_id' => trainer1.id  } ).save(  )

pokemon3 = Pokemon.new( { 'name' => 'Meowth,', 'type_one' => 'Stupid Cat', 'trainer_id' => trainer3.id  } ).save(  )


#Used for checking if Instance method save works.
#trainer4 = Trainer.new( { 'name' => 'Red', 'discipline' => 'Silent Protagonist', 'city' => 'Vermillion City', 'gym_id' => gym2.id } ).save(  )

#pokemon4 = Pokemon.new( { 'name' => 'Charmander,', 'type_one' => 'Fire', 'trainer_id' => trainer2.id  } ).save(  )

#gym4 = Gym.new( { 'name' => 'Celadon City Gym', 'city' => 'Celadon City', 'leader' => 'Erika' } ).save(  )



binding.pry
nil
