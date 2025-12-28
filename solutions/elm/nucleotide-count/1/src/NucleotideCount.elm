module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


atcg =
    ['A', 'T', 'C', 'G']


nucleotideCounts : String -> Result String NucleotideCounts
nucleotideCounts sequence =
    let
        charSeq =
            String.toList sequence

        gard =
            charSeq
                |> List.map
                    (\char -> not <| List.member char atcg)
                |> List.filter identity
                |> List.length

        nucleotideCountsHelper : 
            List Char
            -> NucleotideCounts
            -> NucleotideCounts
        nucleotideCountsHelper seq ({a, t, c, g} as rec) =
            case seq of
                [] -> 
                    rec

                head :: tail ->
                    if head == 'A' then
                        nucleotideCountsHelper tail {rec| a= a + 1}

                    else if head == 'T' then
                        nucleotideCountsHelper tail {rec| t= t + 1}

                    else if head == 'C' then
                        nucleotideCountsHelper tail {rec| c= c + 1}

                    else if head == 'G' then
                        nucleotideCountsHelper tail {rec| g= g + 1}

                    else
                        nucleotideCountsHelper tail rec
    in
    if gard > 0 then
        Err "Invalid nucleotide in strand"
    else
        NucleotideCounts 0 0 0 0
            |> nucleotideCountsHelper charSeq
            |> Ok
