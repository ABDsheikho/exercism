module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    let
        gameNumbers = [3,5,7]
        keywords = ["Pling", "Plang", "Plong"]
        -- I should've assert if gameNumbers has the same length as keywords

        resList = mapGame number gameNumbers keywords
        finalResult = String.concat resList
    in
    if finalResult == "" then
        String.fromInt number
    else
        finalResult


mapGame : Int -> List Int -> List String -> List String
mapGame number gameNumbers keywords = 
    -- I should've assert if gameNumbers has the same length as keywords
    List.map3 fuzzBuzzLogic (
            List.repeat (List.length gameNumbers) number
            ) gameNumbers keywords


fuzzBuzzLogic : Int -> Int -> String -> String
fuzzBuzzLogic numerator denominator keyword =
    if remainderBy denominator numerator == 0 then
        keyword
    else
        ""

