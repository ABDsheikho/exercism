module NthPrime

let isPrime (number: int) : bool =
    let rec looping divisor number =
        if number = divisor then
            true
        elif number % divisor = 0 then
            false
        else
            // looping over odd numbers
            looping (divisor + 2) number

    match number with
    | 2 -> true
    | n when n < 2 -> false
    | n when n % 2 = 0 -> false
    | _ -> looping 3 number


let prime nth : int option =
    let rec primeHelper = Seq.initInfinite id |> Seq.filter isPrime

    if nth <= 0 then
        None
    else
        Some <| Seq.item (nth - 1) primeHelper
