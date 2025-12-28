module GottaSnatchEmAll exposing (..)

import Set exposing (Set)


type alias Card =
    String


newCollection : Card -> Set Card
newCollection card =
    Set.singleton card


addCard : Card -> Set Card -> ( Bool, Set Card )
addCard card collection =
    if Set.member card collection then
        ( True, collection )
    else
        ( False, Set.insert card collection )


tradeCard : Card -> Card -> Set Card -> ( Bool, Set Card )
tradeCard yourCard theirCard collection =
    let
        iHave =
            Set.member yourCard collection
        alsoHave =
            Set.member theirCard collection
        applyTrade =
            Set.remove yourCard >> Set.insert theirCard
    in
    applyTrade collection
        |> Tuple.pair ((&&) iHave <| not alsoHave)


removeDuplicates : List Card -> List Card
removeDuplicates cards =
    Set.fromList cards
        |> Set.toList


extraCards : Set Card -> Set Card -> Int
extraCards yourCollection theirCollection =
    Set.diff yourCollection theirCollection
        |> Set.size


boringCards : List (Set Card) -> List Card
boringCards collections =
    case collections of
        [] ->
            []
        first :: reast ->
            List.foldl Set.intersect first reast
                |> Set.toList


totalCards : List (Set Card) -> Int
totalCards collections =
    let
        init : Set Card
        init = Set.empty
    in
    List.foldl Set.union init collections
        |> Set.size


splitShinyCards : Set Card -> ( List Card, List Card )
splitShinyCards collection =
    Set.partition (String.startsWith "Shiny") collection
        |> Tuple.mapBoth Set.toList Set.toList
