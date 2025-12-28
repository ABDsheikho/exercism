module Etl exposing (transform)

import Dict exposing (Dict)


transform : Dict Int (List String) -> Dict String Int
transform input =
    Dict.toList input
        |> List.concatMap (\(k, lst) -> List.map (\c -> (String.toLower c, k)) lst )
        |> Dict.fromList
