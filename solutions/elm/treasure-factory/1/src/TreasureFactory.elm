module TreasureFactory exposing (TreasureChest, getTreasure, makeChest, makeTreasureChest, secureChest, uniqueTreasures)


type TreasureChest treasure
    = TreasureChest String treasure


getTreasure : String -> TreasureChest a -> Maybe a
getTreasure passwordAttempt (TreasureChest password treasure) =
    if passwordAttempt == password then
        Just treasure

    else
        Nothing


type Chest treasure conditions
    = Chest String treasure


makeChest : String -> treasure -> Chest treasure {}
makeChest password treasure =
    Chest password treasure


secureChest :
    Chest treasure conditions
    -> Maybe (Chest treasure { conditions | securePassword : () })
secureChest (Chest password treasure) =
    if String.length password < 8 then
        Nothing

    else
        Just (Chest password treasure)


uniqueTreasures :
    List (Chest treasure conditions)
    -> List (Chest treasure { conditions | uniqueTreasure : () })
uniqueTreasures chests =
    let
        filterChests (Chest password treasure) cs =
            let
                occurrences =
                    chests
                        |> List.filter (\(Chest _ t) -> t == treasure)
                        |> List.length
            in
            if occurrences == 1 then
                Chest password treasure :: cs

            else
                cs
    in
    List.foldr filterChests [] chests


makeTreasureChest :
    Chest treasure { conditions | securePassword : (), uniqueTreasure : () }
    -> TreasureChest treasure
makeTreasureChest (Chest password treasure) =
    TreasureChest password treasure
