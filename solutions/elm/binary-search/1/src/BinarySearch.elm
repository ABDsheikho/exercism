module BinarySearch exposing (find)

import Array exposing (Array)


find : Int -> Array Int -> Maybe Int
find target xs =
    binLogic target xs 0

binLogic : Int -> Array Int -> Int -> Maybe Int
binLogic target xs counter =
    let
        mid = (Array.length xs) // 2
    in
    case (Array.get mid xs) of
        Nothing ->
            Nothing
        Just val ->
            let
                len = Array.length xs
            in
            if target < val then
                binLogic target (Array.slice 0 mid xs) counter
            else if target > val then
                binLogic target (Array.slice (mid+1) (len) xs) (counter+mid+1)
            else
                Just (mid+counter)
