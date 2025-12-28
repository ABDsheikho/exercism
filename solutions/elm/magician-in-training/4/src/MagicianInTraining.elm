module MagicianInTraining exposing (..)

import Array exposing (Array)


getCard : Int -> Array Int -> Maybe Int
getCard index deck =
    Array.get index deck


setCard : Int -> Int -> Array Int -> Array Int
setCard index newCard deck =
    Array.set index newCard deck


addCard : Int -> Array Int -> Array Int
addCard newCard deck =
    Array.push newCard deck


removeCard : Int -> Array Int -> Array Int
removeCard index deck =
    deck
    |> Array.toIndexedList
    |> List.filter ( (\v (idx, _) -> idx /= v) index )
    |> List.map (\(_, v) -> v)
    |> Array.fromList


evenCardCount : Array Int -> Int
evenCardCount deck =
    deck
    |> Array.filter (\number -> modBy 2 number == 0)
    |> Array.length