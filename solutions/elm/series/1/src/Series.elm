module Series exposing (slices)


slices : Int -> String -> Result String (List (List Int))
slices size input =
    let
        len =
            String.length input

        slicesHelper idx acc =
            if idx < 0 then
                acc
            else
                acc
                    |> (::) ( String.slice idx ( idx + size ) input )
                    |> slicesHelper ( idx - 1 )
    in
    if size == 0 then
        Err "slice length cannot be zero"
    else if size < 0 then
        Err "slice length cannot be negative"
    else if len == 0 then
        Err "series cannot be empty"
    else if size > len then
        Err "slice length cannot be greater than series length"
    else
        slicesHelper ( len - size ) []
            |> List.map ( String.split "" )
            |> List.map ( List.map ( String.toInt >> Maybe.withDefault 0 ) )
            |> Ok
