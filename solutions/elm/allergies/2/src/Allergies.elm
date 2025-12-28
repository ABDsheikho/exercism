module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


allergies : List Allergy
allergies =
    [ Eggs
    , Peanuts
    , Shellfish
    , Strawberries
    , Tomatoes
    , Chocolate
    , Pollen
    , Cats
    ]


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    toList score
        |> List.member allergy


toList : Int -> List Allergy
toList score =
    allergies
        |> List.indexedMap (\idx alg -> ( Bitwise.shiftLeftBy idx 1, alg ))
        |> List.filter (\( idx, _ ) -> Bitwise.and idx score > 0)
        |> List.map Tuple.second
