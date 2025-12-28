module AllYourBase exposing (rebase)


rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =
    let
        invalidBase =
            inBase < 2 || outBase < 2

        allZeros =
            List.all ((==) 0) digits

        anyNegative =
            List.any ((>) 0) digits

        biggerThanBase =
            List.any ((<=) inBase) digits

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
                |> toBase outBase
                |> Just

        _ ->
            Nothing


toBaseTen : Int -> List Int -> Int
toBaseTen inBase digits =
    digits
        |> List.reverse
        |> List.indexedMap (\idx val -> val * inBase ^ idx)
        |> List.sum


toBase : Int -> Int -> List Int
toBase outBase number =
    let
        toBaseHelper acc outBse num =
            if num == 0 then
                acc

            else
                (acc
                    |> (::) (remainderBy outBse num)
                    |> toBaseHelper
                )
                    outBse
                    (num // outBse)
    in
    toBaseHelper [] outBase number
