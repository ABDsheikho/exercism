module PerfectNumbers

type Classification = Perfect | Abundant | Deficient 

let factorize number =
    let rec factorizeHelper acc divisor number =
        if divisor > number / 2 then
            acc |> List.rev
        elif number % divisor = 0 then
            factorizeHelper (divisor :: acc) (divisor + 1) number
        else
            factorizeHelper acc (divisor + 1) number
    match number with
    | number when number <= 0 -> None
    | number when List.contains number [1;2;3] -> Some [1]
    | _ -> Some <| factorizeHelper [1] 2 number

let classify n : Classification option = 
    let res = n
            |> factorize
            |> Option.map List.sum
    match res with
    | Some num when num = 1 -> Some Deficient
    | Some num when num < n -> Some Deficient
    | Some num when num = n -> Some Perfect
    | Some num when num > n -> Some Abundant
    | _ -> None
