module TopScorers exposing (..)

import Dict exposing (Dict)
import TopScorersSupport exposing (PlayerName)


updateGoalCountForPlayer : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
updateGoalCountForPlayer playerName playerGoalCounts =
    case Dict.get playerName playerGoalCounts of
        Nothing ->
            Dict.insert playerName 1 playerGoalCounts
        Just _ ->
            Dict.update playerName (Maybe.map ((+) 1) ) playerGoalCounts


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
    Maybe.withDefault 0 (Dict.get playerName playerGoalCounts)
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
