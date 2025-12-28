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
    if index < 0 || index > Array.length deck then
        deck
    else
        let
            len = Array.length deck
            left = Array.slice 0 index deck
            right = Array.slice (index+1) len deck
        in
        Array.append left right


evenCardCount : Array Int -> Int
evenCardCount deck =
    let
        evens = Array.filter (\number -> if modBy 2 number == 0 then True else False) deck
    in
    Array.length evens