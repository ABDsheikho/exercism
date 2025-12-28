module NthPrime


let isPrime (number: int) :bool =
    let rec looping divisor number =
        if number = divisor then
            true
        elif number % divisor = 0 then
            false
        else
            // looping over odd numbers
            looping (divisor + 2) number
    if number = 2 then
        true
    elif number % 2 = 0 then
        false
    else
        looping 3 number

let nextUpperPrime (number: int) :int =
    let rec nextPrimeHelper number =
        if isPrime(number) then
            number
        else
            nextPrimeHelper(number + 2)
    if number = 2 then
        3
    elif number % 2 = 0 then
        nextPrimeHelper(number+1)
    else
        nextPrimeHelper(number+2)


let prime nth : int option = 
    let rec primeHelper nth baseNumber =
        match nth with
        | nth when nth = 1 -> baseNumber
        | nth when nth > 1 -> primeHelper (nth - 1) <| nextUpperPrime baseNumber
        | _ -> 0
    if nth <= 0 then
        None
    else
        Some <| primeHelper nth 2
