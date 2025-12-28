module Go exposing (..)

import GoSupport exposing (..)


applyRules : Game -> Rule -> NonValidatingRule -> Rule -> Rule -> Game
applyRules game oneStonePerPointRule captureRule libertyRule koRule =
    let
        check = 
            game
            |> oneStonePerPointRule
            |> Result.andThen libertyRule
            |> Result.andThen koRule
    in
    case check of
        Err err ->
            {game | error= err}
        Ok gm ->
            gm |> captureRule |> changePlayer