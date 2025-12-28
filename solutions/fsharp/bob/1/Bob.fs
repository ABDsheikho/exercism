module Bob

open System

let isUpper (str: String) : bool =
    match (str |> String.filter Char.IsLetter) with
    | "" -> false
    | anyStr -> String.forall Char.IsUpper anyStr

let response (input: string) : string =
    let clean = input.Trim()

    match (clean, clean.EndsWith("?"), isUpper clean) with
    | (_, true, false) -> "Sure."
    | (_, false, true) -> "Whoa, chill out!"
    | (_, true, true) -> "Calm down, I know what I'm doing!"
    | ("", _, _) -> "Fine. Be that way!"
    | _ -> "Whatever."
