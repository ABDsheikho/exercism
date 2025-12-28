module AllYourBase exposing (rebase)


rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =
    let
        invalidBase =
            inBase < 2 || outBase < 2

        allZeros =
            List.all (\x -> x == 0) digits

        anyNegative =
            List.any (\x -> x < 0) digits

        biggerThanBase =
            List.any (\x -> x >= inBase) digits

        invalid =
            invalidBase
                || allZeros
                || anyNegative
                || biggerThanBase
    in
    case ( digits, invalid ) of
        ( _ :: _, False ) ->
            digits
                |> toBaseTen inBase
                |> toBaseAny outBase
                |> Just

        _ ->
            Nothing


toBaseTen : Int -> List Int -> Int
toBaseTen inBase digits =
    digits
        |> List.reverse
        |> List.indexedMap (\idx val -> val * inBase ^ idx)
        |> List.sum


toBaseAny : Int -> Int -> List Int
toBaseAny outBase number =
    let
        toBaseAnyHelper acc outBse num =
            if num == 0 then
                acc

            else
                (acc
                    |> (::) (remainderBy outBse num)
                    |> toBaseAnyHelper
                )
                    outBse
                    (num // outBse)
    in
    toBaseAnyHelper [] outBase number
