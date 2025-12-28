module LuciansLusciousLasagna


let expectedMinutesInOven = 40


let remainingMinutesInOven minutes =
    expectedMinutesInOven - minutes


let minutesForOneLayer = 2


let preparationTimeInMinutes layers =
    minutesForOneLayer * layers


let elapsedTimeInMinutes layers minutes =
    preparationTimeInMinutes layers
        |> (+) minutes
