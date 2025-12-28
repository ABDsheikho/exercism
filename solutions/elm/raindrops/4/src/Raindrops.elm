module Raindrops exposing (raindrops)

raindropNumbers = [3,5,7]
raindropKeywords = ["Pling", "Plang", "Plong"]

raindrops : Int -> String
raindrops number =
    let
        result =
            mapGame raindropKeywords raindropNumbers number |> String.concat
    in
    if result == "" then
        String.fromInt number
    else
        result


mapGame : List String -> List Int -> Int -> List String
mapGame keywords gameNumbers number = 
    -- I should've assert if gameNumbers has the same length as keywordsz
    let
        nbs = List.length gameNumbers
    in
    number
    |> List.repeat nbs
    |> List.map3 fuzzBuzzLogic keywords gameNumbers


fuzzBuzzLogic : String -> Int -> Int -> String
fuzzBuzzLogic keyword denominator numerator =
    if remainderBy denominator numerator == 0 then
        keyword
    else
        ""

