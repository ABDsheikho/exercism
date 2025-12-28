module TisburyTreasureHunt exposing (..)

type alias TreasureLocation = (Int, Char)
type alias Treasure = (String, TreasureLocation)
type alias PlaceLocation = (Char, Int)
type alias Place = (String, PlaceLocation)


placeLocationToTreasureLocation : ( Char, Int ) -> ( Int, Char )
placeLocationToTreasureLocation placeLocation =
    (Tuple.second placeLocation, Tuple.first placeLocation)


treasureLocationMatchesPlaceLocation : ( Char, Int ) -> ( Int, Char ) -> Bool
treasureLocationMatchesPlaceLocation placeLocation treasureLocation =
    placeLocation
    |> placeLocationToTreasureLocation
    |> (==) treasureLocation


countPlaceTreasures : Place -> List ( Treasure ) -> Int
countPlaceTreasures (_, placeLocation) treasures =
    treasures
    |> List.map (\(_, treasureLocation) -> treasureLocation)  
        -- this is equivalent to unzipping a List of tuples
        -- but with ignoring the first part all together
    |> List.filter (treasureLocationMatchesPlaceLocation placeLocation)
    |> List.length


specialCaseSwapPossible : Treasure -> Place -> Treasure -> Bool
specialCaseSwapPossible ( foundTreasure, _ ) ( place, _ ) ( desiredTreasure, _ ) =
    case (foundTreasure, place, desiredTreasure) of
    ("Brass Spyglass", "Abandoned Lighthouse", _) ->
        True
    ("Amethyst Octopus", _, "Crystal Crab") ->
        True
    ("Amethyst Octopus", "Stormy Breakwater", "Glass Starfish") ->
        True
    ("Vintage Pirate Hat", "Harbor Managers Office", "Model Ship in Large Bottle") ->
        True
    ("Vintage Pirate Hat", "Harbor Managers Office", "Antique Glass Fishnet Float") ->
        True
    _ ->
        False