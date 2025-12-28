module Accumulate

let accumulate (func: 'a -> 'b) (input: 'a list) : 'b list =
    let rec accumulateHelper lst acc =
        match lst with
        | [] -> List.rev acc
        | head :: tail -> (func head) :: acc |> accumulateHelper tail

    accumulateHelper input []
