module CarsAssemble

let successRate (speed: int): float =
    if speed <= 0 then
        0.0
    elif 1 <= speed && speed < 5 then
        1.0
    elif 5 <= speed && speed < 9 then
        0.9
    elif 9 <= speed && speed < 10 then
        0.8
    else
        0.77

let carsPerOneHour = 221

let productionRatePerHour (speed: int): float =
    successRate(speed) * float(speed * carsPerOneHour)

let workingItemsPerMinute (speed: int): int =
    productionRatePerHour(speed) / 60.0
        |> int
