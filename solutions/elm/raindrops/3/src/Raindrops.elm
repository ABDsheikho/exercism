module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    let
        gameNumbers = [3,5,7]
        keywords = ["Pling", "Plang", "Plong"]
        -- I should've assert if gameNumbers has the same length as keywords

        result =
            mapGame number gameNumbers keywords |> String.concat
    in
    if result == "" then
        String.fromInt number
    else
        result


mapGame : Int -> List Int -> List String -> List String
mapGame number gameNumbers keywords = 
    -- I should've assert if gameNumbers has the same length as keywordsz
    let
        numberListed = List.repeat (List.length gameNumbers) number
    in
    List.map3 fuzzBuzzLogic numberListed gameNumbers keywords


fuzzBuzzLogic : Int -> Int -> String -> String
fuzzBuzzLogic numerator denominator keyword =
    if remainderBy denominator numerator == 0 then
        keyword
    else
        ""

