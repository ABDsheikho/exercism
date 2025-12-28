module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


acgt =
    [ 'A', 'C', 'G', 'T' ]


isValid : List Char -> Result String (List Char)
isValid list =
    if List.any (\char -> not <| List.member char acgt) list then
        Err "Invalid nucleotide in strand"

    else
        Ok list


nucleotideCounts : String -> Result String NucleotideCounts
nucleotideCounts sequence =
    let
        nucleotideCountsHelper : Char -> NucleotideCounts -> NucleotideCounts
        nucleotideCountsHelper char nc =
            case char of
                'A' ->
                    { nc | a = nc.a + 1 }

                'C' ->
                    { nc | c = nc.c + 1 }

                'G' ->
                    { nc | g = nc.g + 1 }

                'T' ->
                    { nc | t = nc.t + 1 }

                _ ->
                    nc
    in
    sequence
        |> String.toList
        |> isValid
        |> Result.map
            (List.foldl nucleotideCountsHelper (NucleotideCounts 0 0 0 0))
