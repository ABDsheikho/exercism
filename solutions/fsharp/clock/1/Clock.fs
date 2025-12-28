module Clock

type OClock = {hours: int; minutes: int}

let rec private wrappingClock counter num number =
    if number < 0 then
        wrappingClock (counter - 1) num (number + num)
    elif number >= num then
        wrappingClock (counter + 1) num (number - num)
    else
        (counter, number)

let create hours minutes : OClock= 
    let rewindedHours, correctMinutes = wrappingClock 0 60 minutes
    let _, correctHour = wrappingClock 0 24 (hours + rewindedHours)
    {hours=correctHour ; minutes=correctMinutes}

let add minutes (clock: OClock) = 
    let resultMinutes = clock.minutes + minutes
    create clock.hours resultMinutes

let subtract minutes (clock: OClock) = 
    let resultMinutes = clock.minutes - minutes
    create clock.hours resultMinutes

let display (clock: OClock) = 
    let formatWithZero (number: int): string = 
        if number < 10 then
            $"0{number}" 
        else
            $"{number}"
    let formatedHours = formatWithZero clock.hours
    let formatedMinutes = formatWithZero clock.minutes
    $"%s{formatedHours}:%s{formatedMinutes}"