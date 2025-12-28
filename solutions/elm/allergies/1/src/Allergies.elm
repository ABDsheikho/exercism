module Allergies exposing (Allergy(..), isAllergicTo, toList)


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
    toBinary score 8 []
        |> List.reverse -- because `allergies` is defined from bottom to top
        |> List.map2 
            (\aler bin -> if bin == 1 then Just aler else Nothing) allergies
        |> List.filterMap identity


toBinary : Int -> Int -> List Int -> List Int
toBinary number size acc = 
    let
        -- to produce exactly the desired size *number* of digits
        com = List.length acc |> compare size
        dif = (List.length acc) - size
    in
    case (number, com) of
        (0, EQ) ->
            acc
        (0, LT) ->
            (List.repeat (abs dif) 0) ++ acc
        (0, GT) ->
            List.drop dif acc
        _ ->
            (modBy 2 number) :: acc
                |> toBinary (number // 2) size

