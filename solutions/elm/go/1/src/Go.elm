module Go exposing (..)

import GoSupport exposing (..)


applyRules : Game -> Rule -> NonValidatingRule -> Rule -> Rule -> Game
applyRules game oneStonePerPointRule captureRule libertyRule koRule =
    case (oneStonePerPointRule game, libertyRule game, koRule game) of
        (Err err, _, _) ->
            {game | error = err}
        (_, Err err, _) ->
            {game | error = err}
        (_, _, Err err) ->
            {game | error = err}
        (_, _, _) ->
            game |> captureRule |> changePlayer