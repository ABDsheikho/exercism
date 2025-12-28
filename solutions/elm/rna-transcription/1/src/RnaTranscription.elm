module RnaTranscription exposing (toRNA)


toRNA : String -> Result String String
toRNA dna =
    let
        mapNucleotide : Char -> Result String Char
        mapNucleotide char =
            case char of
                'G' -> Ok 'C'
                'C' -> Ok 'G'
                'T' -> Ok 'A'
                'A' -> Ok 'U'
                _ -> Err "Invalid nucleotide."
        
        mapThenConcat = 
            mapNucleotide >> Result.map2 String.cons
    in
    String.foldr
        (\char resStr -> mapThenConcat char resStr)
        (Result.Ok "")
        dna
