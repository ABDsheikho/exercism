module Clock

type OClock = {hours: int; minutes: int}

let rec private wrappingClock counter unit number =
    match number with
    | number when number < 0 -> wrappingClock (counter - 1) unit (number + unit)
    | number when number >= unit -> wrappingClock (counter + 1) unit (number - unit)
    | _ -> (counter, number)

let create hours minutes : OClock= 
    let rewindedHours, correctMinutes = wrappingClock 0 60 minutes
    let _, correctHour = wrappingClock 0 24 (hours + rewindedHours)
    {hours=correctHour; minutes=correctMinutes}

let add minutes (clock: OClock) = 
    let resultMinutes = clock.minutes + minutes
    create clock.hours resultMinutes

let subtract minutes (clock: OClock) = 
    let resultMinutes = clock.minutes - minutes
    create clock.hours resultMinutes

let display (clock: OClock) = 
    $"%02i{clock.hours}:%02i{clock.minutes}"