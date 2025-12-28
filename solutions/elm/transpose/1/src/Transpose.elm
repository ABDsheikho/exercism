module Transpose exposing (transpose)

import Array exposing (Array)


transpose : List String -> List String
transpose lines =
    let
        maxLength =
            lines
                |> List.map String.length
                |> List.maximum
                |> Maybe.withDefault 0
    in
    lines
        |> List.map String.toList
        |> getColumns maxLength ' '
        |> List.map (String.fromList >> String.trimRight)
        |> trimDescending maxLength


getColumn : Int -> a -> List (List a) -> List a
getColumn column default list =
    let
        arr =
            List.map Array.fromList list

        getColumnHelper col def lst acc =
            case lst of
                [] ->
                    List.reverse acc

                head :: tail ->
                    (Array.get col head
                        |> Maybe.withDefault def
                    )
                        :: acc
                        |> getColumnHelper col def tail
    in
    getColumnHelper column default arr []


getColumns : Int -> a -> List (List a) -> List (List a)
getColumns columnsNumber default list =
    let
        getColumnsHelper cols def lst acc =
            if cols < 0 then
                acc

            else
                getColumn cols def lst
                    :: acc
                    |> getColumnsHelper (cols - 1) def lst
    in
    getColumnsHelper (columnsNumber - 1) default list []


trimDescending : Int -> List String -> List String
trimDescending maxLength list =
    let
        trimDescendingHelper mxlen lst acc =
            case lst of
                [] ->
                    List.reverse acc

                head :: tail ->
                    let
                        newLen =
                            String.length head
                    in
                    if newLen <= mxlen then
                        acc
                            |> (::) (String.trimRight head)
                            |> trimDescendingHelper newLen tail

                    else
                        acc
                            |> List.map (String.padRight newLen ' ')
                            |> (::) head
                            |> trimDescendingHelper newLen tail
    in
    trimDescendingHelper maxLength list []
