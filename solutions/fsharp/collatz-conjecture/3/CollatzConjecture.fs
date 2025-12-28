module CollatzConjecture

let steps (number: int) : int option =
    let rec collatzHelper counter number =
        match (number, number % 2) with
        | (1, _) -> counter
        | (_, 0) -> collatzHelper (counter + 1) (number / 2)
        | _ -> collatzHelper (counter + 1) (3 * number + 1)

    match number with
    | number when number <= 0 -> None
    | _ -> Some <| collatzHelper 0 number
