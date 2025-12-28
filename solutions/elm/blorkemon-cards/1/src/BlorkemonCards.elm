module BlorkemonCards exposing
    ( Card
    , compareShinyPower
    , expectedWinner
    , isMorePowerful
    , maxPower
    , sortByCoolness
    , sortByMonsterName
    )


type alias Card =
    { monster : String, power : Int, shiny : Bool }


isMorePowerful : Card -> Card -> Bool
isMorePowerful card1 card2 =
    card1.power > card2.power


maxPower : Card -> Card -> Int
maxPower card1 card2 =
    max card1.power card2.power


sortByMonsterName : List Card -> List Card
sortByMonsterName cards =
    List.sortBy .monster cards


compareCoolness : Card -> Card -> Order
compareCoolness card1 card2 =
    case (card1.shiny, card2.shiny) of
        (True, False) -> GT
        (False, True) -> LT
        _ -> 
            compare card1.power card2.power


sortByCoolness : List Card -> List Card
sortByCoolness cards =
    List.sortWith compareCoolness cards
        |> List.reverse


compareShinyPower : Card -> Card -> Order
compareShinyPower card1 card2 =
    case compare card1.power card2.power of
        EQ -> 
            compareCoolness card1 card2
        ord -> ord


expectedWinner : Card -> Card -> String
expectedWinner card1 card2 =
    case compareShinyPower card1 card2 of
        EQ -> "too close to call"
        LT -> card2.monster
        GT -> card1.monster
