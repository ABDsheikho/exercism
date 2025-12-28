module RolePlayingGame exposing (Player, castSpell, introduce, revive)

import Basics exposing (max)
import Maybe

type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    Maybe.withDefault "Mighty Magician" name 


revive : Player -> Maybe Player
revive player =
    if player.health > 0 then
        Nothing
    else 
    if player.level >= 10 then
        Just {player | health = 100, mana = Just 100}
    else
        Just {player | health = 100, mana = Nothing}



castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Just mana ->
            let
                damage = 2 * manaCost
                newMana = mana - manaCost
            in
            if newMana > 0 then
                ( {player | mana = Just newMana} ,  damage )
            else
                ( player, 0 )
        Nothing ->
            ( {player | health = max (player.health  - manaCost) 0 }, 0 )
