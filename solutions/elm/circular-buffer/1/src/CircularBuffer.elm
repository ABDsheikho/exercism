module CircularBuffer exposing (CircularBuffer, clear, new, overwrite, read, write)


type CircularBuffer a
    = CircularBuffer Int Int (List a)


new : Int -> CircularBuffer a
new size =
    CircularBuffer 0 size []


push : a -> List a -> List a
push element list =
    list ++ [ element ]


write : a -> CircularBuffer a -> Maybe (CircularBuffer a)
write element (CircularBuffer len size lst) =
    if len == size then
        Nothing

    else
        push element lst
            |> CircularBuffer (len + 1) size
            |> Just


overwrite : a -> CircularBuffer a -> CircularBuffer a
overwrite element (CircularBuffer len size lst) =
    if len == size then
        push element lst
            |> List.drop 1
            |> CircularBuffer len size

    else
        push element lst
            |> CircularBuffer (len + 1) size


read : CircularBuffer a -> Maybe ( a, CircularBuffer a )
read (CircularBuffer len size lst) =
    case lst of
        [] ->
            Nothing

        head :: tail ->
            Just ( head, CircularBuffer (len - 1) size tail )


clear : CircularBuffer a -> CircularBuffer a
clear (CircularBuffer len size lst) =
    new size
