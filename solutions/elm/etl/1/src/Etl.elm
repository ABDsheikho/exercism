module Etl exposing (transform)

import Dict exposing (Dict)


transform : Dict Int (List String) -> Dict String Int
transform input =
    Dict.toList input
        |> List.map (\(k, lst) -> List.map (\c -> (String.toLower c, k)) lst )
        |> List.map Dict.fromList
        |> List.foldl Dict.union Dict.empty
