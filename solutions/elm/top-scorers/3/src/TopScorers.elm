module TopScorers exposing (..)

import Dict exposing (Dict)
import TopScorersSupport exposing (PlayerName)

{-
Let's break down the function updateGoalCountForPlayer step by step:

1. updateGoalCountForPlayer playerName =: This defines a function called updateGoalCountForPlayer that takes a parameter playerName.

2. Dict.update playerName: This is a function from the Elm standard library that updates the value associated with a key in a dictionary.

3. (Maybe.map ((+) 1) >> Maybe.withDefault 1 >> Just): This is a composition of functions that are applied to the value associated with the key playerName in the dictionary.

   - Maybe.map ((+) 1): This function takes a value from the dictionary (if it exists) and adds 1 to it. It uses Maybe.map because the value may or may not exist in the dictionary.
   
   - Maybe.withDefault 1: If the value does not exist in the dictionary, this function returns a default value of 1.
   
   - Just: Finally, this function wraps the result in a Just constructor to indicate that it is a valid value.

So, overall, this function updates the goal count for a player in a dictionary by incrementing it by 1 if it exists, or setting it to 1 if it doesn't exist.
-}
updateGoalCountForPlayer : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
updateGoalCountForPlayer playerName =
    Dict.update playerName (Maybe.map ((+) 1) >> Maybe.withDefault 1 >> Just)


aggregateScorers : List PlayerName -> Dict PlayerName Int
aggregateScorers playerNames =
    List.foldl updateGoalCountForPlayer Dict.empty playerNames


removeInsignificantPlayers : Int -> Dict PlayerName Int -> Dict PlayerName Int
removeInsignificantPlayers goalThreshold playerGoalCounts =
    Dict.filter (\_ goals -> goals >= goalThreshold) playerGoalCounts


resetPlayerGoalCount : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
resetPlayerGoalCount playerName playerGoalCounts =
    Dict.insert playerName 0 playerGoalCounts


representNameAndGoals : String -> String -> Int -> String
representNameAndGoals separator name goals =
    name ++ separator ++ String.fromInt goals


formatPlayer : PlayerName -> Dict PlayerName Int -> String
formatPlayer playerName playerGoalCounts =
    Dict.get playerName playerGoalCounts
    |> Maybe.withDefault 0
    |> representNameAndGoals ": " playerName


formatPlayers : Dict PlayerName Int -> String
formatPlayers players =
    Dict.toList players
    |> List.map (\(name, goals) -> representNameAndGoals ": " name goals)
    |> String.join ", "


combineGames : Dict PlayerName Int -> Dict PlayerName Int -> Dict PlayerName Int
combineGames game1 game2 =
    Dict.merge
        (\key a -> Dict.insert key a)
        (\key a b -> Dict.insert key (a + b))
        (\key b -> Dict.insert key b)
        game1
        game2
        Dict.empty
