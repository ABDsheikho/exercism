module Minesweeper exposing (annotate)

import Dict exposing (Dict)


type Check
    = Mine
    | Clear


type alias Point =
    ( Int, Int )


type alias Matrix a =
    List (List a)


type alias Grid a =
    Dict Point a


type alias Field =
    { string : String
    , chars : Matrix Char
    , rowsAndCols : Point
    }


annotate : String -> String
annotate minefield =
    let
        field =
            makeFeild minefield

        hotPoints =
            listHotPoints field

        grid =
            makeGrid field
    in
    countHotness hotPoints grid
        |> countToChars
        |> reformatString field



-- functions for that works directly on `annotate`


makeFeild : String -> Field
makeFeild minefield =
    let
        lines =
            String.lines minefield

        chars =
            List.map (String.trim >> String.toList) lines

        rowsNumber =
            List.length lines

        colsNumber =
            List.head lines
                |> Maybe.withDefault ""
                |> String.length
    in
    Field minefield chars ( rowsNumber, colsNumber )


{-| iterate over a Matrix of Char to make a List of point's 
coordinates with its check.
-}
scan : Matrix Char -> List ( Point, Check )
scan chars =
    indexedMapMatrix
        (\point char ->
            if char == '*' then
                ( point, Mine )

            else
                ( point, Clear )
        )
        chars
        |> List.concat


makeGrid : Field -> Grid Check
makeGrid { chars } =
    scan chars
        |> Dict.fromList


{-| given a Field, get a list of points that surrounds Mine points.
-}
listHotPoints : Field -> List Point
listHotPoints { chars, rowsAndCols } =
    scan chars
        |> List.filter (\( _, check ) -> check == Mine)
        -- since a point could be a hot point and a Mine at the same time,
        -- example having "**."
        -- and since we only care for Clear points when we assign counts,
        -- you maybe tempted to filter them out and the end of this pipeline
        -- like:
        --     List.filter (\point -> not <| List.member point `minePoints`)
        -- But no, you shouldn't do that. because the `countToChars` function
        -- will convert a Mine into '*' regardless of it being a hot point
        -- or if it has count.
        |> List.concatMap (Tuple.first >> surroundingPoints rowsAndCols)


countHotness : List Point -> Grid Check -> Grid ( Check, Int )
countHotness hotPoints grid =
    let
        withZeros =
            Dict.map (\_ chk -> ( chk, 0 )) grid
    in
    List.foldl
        (\val acc ->
            Dict.update val (Maybe.map (\( chk, n ) -> ( chk, n + 1 ))) acc
        )
        withZeros
        hotPoints


countToChars : Grid ( Check, Int ) -> Grid Char
countToChars grid =
    let
        mapper : k -> ( Check, Int ) -> Char
        mapper _ val =
            case val of
                ( Mine, _ ) ->
                    '*'

                ( Clear, 0 ) ->
                    '.'

                ( _, n ) ->
                    n + Char.toCode '0' |> Char.fromCode
    in
    Dict.map mapper grid


{-| given Grid of characters, rebuild the multiline string
based on information from the Field such as the number of
rows and columns, and the original string.
-}
reformatString : Field -> Grid Char -> String
reformatString { string, rowsAndCols } gird =
    gird
        |> Dict.values
        |> reshapeTo rowsAndCols
        |> Maybe.map (List.intersperse [ '\n' ] >> List.concat >> String.fromList)
        |> Maybe.withDefault string



-- functions for working on boundaries and validation


{-| given the maximum number of rows and columns as a boundaries,
validate if a point's coordinates are less than that boundary,
while also being greater than or equal to zero.
-}
isValidPoint : ( Int, Int ) -> Point -> Bool
isValidPoint ( maxRows, maxCols ) ( iRow, iCol ) =
    iRow >= 0 && iRow < maxRows && iCol >= 0 && iCol < maxCols


{-| given an un-included bounds and a point's coordinates,
get a list of valid surrounding points to it, excluding 
the point itself.
-}
surroundingPoints : Point -> Point -> List Point
surroundingPoints bounds (( iRow, iCol ) as point) =
    let
        -- generate a sequance of
        -- [-1, -1, -1, 0, 0, 0, 1, 1, 1]
        -- to map it as
        -- [iRow - 1, iRow - 1, iRow - 1, iRow, iRow, iRow, ...]
        rows =
            List.repeat 9 iRow
                |> List.indexedMap (\idx val -> (idx // 3) - 1 + val)

        -- generate a sequance of
        -- [- 1, 0, + 1, - 1, 0, + 1, - 1, 0, + 1]
        -- to map it as
        -- [iCol - 1, iCol, iCol + 1, iCol - 1, iCol, iCol + 1, ...]
        cols =
            List.repeat 9 iCol
                |> List.indexedMap (\idx val -> modBy 3 idx - 1 + val)

        pointsFilter ( x, y ) =
            isValidPoint bounds ( x, y )
                |> (&&) (( x, y ) /= point)
    in
    if isValidPoint bounds point then
        List.map2 Tuple.pair rows cols
            |> List.filter pointsFilter

    else
        -- original point itself is out-off bounds.
        -- maybe I should have made the function to
        -- return an error using Result type.
        []



-- functions for working with Matrices


{-| based on a given Matrix, get a new Matrix of the coordinates

example:
[ [ 'A', 'B', 'C' ] ] -> [ [ ( 0, 1 ), ( 0, 2 ), ( 0, 3 ) ] ]

-}
indexedMatrix : Matrix a -> Matrix ( Int, Int )
indexedMatrix mat =
    List.indexedMap
        (\row lst -> List.indexedMap (\col _ -> ( row, col )) lst)
        mat


{-| similar to `List.map2` where you can map two Lists with one function,
`map2Matrix` proivde the same functionality for mapping two Matrices
with one function.
-}
map2Matrix : (a -> b -> result) -> Matrix a -> Matrix b -> Matrix result
map2Matrix func mat1 mat2 =
    List.map2 (\lst1 lst2 -> List.map2 func lst1 lst2) mat1 mat2


{-| similar to `List.indexedMap` where you can map a List while also
using the indices, `indexedMapMatrix` proivde the same functionality
but using a coordinate instead of normal single integers.
-}
indexedMapMatrix : (( Int, Int ) -> a -> result) -> Matrix a -> Matrix result
indexedMapMatrix func mat =
    map2Matrix func (indexedMatrix mat) mat


{-| reshape a List into 2D-Matrix given the number of rows and columns
-}
reshapeTo : ( Int, Int ) -> List a -> Maybe (Matrix a)
reshapeTo ( rows, cols ) list =
    let
        reshapeToHelper lst acc =
            case lst of
                [] ->
                    List.reverse acc

                _ ->
                    List.take cols lst
                        :: acc
                        |> reshapeToHelper (List.drop cols lst)
    in
    if List.length list /= (rows * cols) then
        Nothing

    else
        Just <| reshapeToHelper list []
