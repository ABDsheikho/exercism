module MariosMarvellousLasagna exposing (remainingTimeInMinutes)

-- TODO: define the remainingTimeInMinutes function



remainingTimeInMinutes layers minutes = 
    let
        expectedMinutesInOven = 40
        preparationTimeInMinutes layer = 
            2 * layer
    in
    expectedMinutesInOven + preparationTimeInMinutes layers - minutes