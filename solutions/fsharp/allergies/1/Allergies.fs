module Allergies

open System


type Allergen = 
    | Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


let allergies: list<Allergen> = 
    [ Eggs
    ; Peanuts
    ; Shellfish
    ; Strawberries
    ; Tomatoes
    ; Chocolate
    ; Pollen
    ; Cats
    ]


let list (codedAllergies : int) = 
    allergies
        |> List.mapi (fun idx alg -> (1 <<< idx,alg))
        |> List.filter (fun (idx, _) -> codedAllergies &&& idx > 0)
        |> List.map (fun (_, alg) -> alg)


let allergicTo (codedAllergies : int) (allergen : Allergen) : bool = 
    list codedAllergies
        |> List.contains allergen
