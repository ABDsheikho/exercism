module TisburyTreasureHunt exposing (..)

-- Consider defining a type alias for TreasureLocation,
type alias TreasureLocation = (Int, Char)
type alias Treasure = (String, TreasureLocation)
type alias PlaceLocation = (Char, Int)
type alias Place = (String, PlaceLocation)
-- Treasure, PlaceLocation and Place,
-- and using them in the function type annotations


placeLocationToTreasureLocation : ( Char, Int ) -> ( Int, Char )
placeLocationToTreasureLocation placeLocation =
    (Tuple.second placeLocation, Tuple.first placeLocation)


treasureLocationMatchesPlaceLocation : ( Char, Int ) -> ( Int, Char ) -> Bool
treasureLocationMatchesPlaceLocation placeLocation treasureLocation =
    placeLocation
    |> placeLocationToTreasureLocation
    |> (==) treasureLocation


countPlaceTreasures : Place -> List ( Treasure ) -> Int
countPlaceTreasures place treasures =
    let
        (_, locs) = List.unzip treasures
        treasurePlace = 
            place
            |> Tuple.second
            |> treasureLocationMatchesPlaceLocation
    in
    locs
    |> List.filter treasurePlace
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