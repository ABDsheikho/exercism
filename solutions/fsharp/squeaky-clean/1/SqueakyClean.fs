module SqueakyClean

open System

let transform (c: char) : string =
    match c with
    | '-' -> "_"
    | ' ' -> ""
    | c when Char.IsUpper c -> $"-{Char.ToLower c}"
    | c when Char.IsNumber c -> ""
    | c when 'α' <= c && c <= 'ω' -> "?"
    | _ -> string c

let clean (identifier: string) : string = 
    String.collect transform identifier
