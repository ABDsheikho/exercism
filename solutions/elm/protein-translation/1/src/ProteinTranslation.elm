module ProteinTranslation exposing (Error(..), proteins)

import Dict exposing (Dict)


type Error
    = InvalidCodon


type RNA name
    = Protein name
    | Stop


codonCodeMap : Dict String (RNA String)
codonCodeMap =
    Dict.fromList
        [ ( "AUG", Protein "Methionine" )
        , ( "UUU", Protein "Phenylalanine" )
        , ( "UUC", Protein "Phenylalanine" )
        , ( "UUA", Protein "Leucine" )
        , ( "UUG", Protein "Leucine" )
        , ( "UCU", Protein "Serine" )
        , ( "UCC", Protein "Serine" )
        , ( "UCA", Protein "Serine" )
        , ( "UCG", Protein "Serine" )
        , ( "UAU", Protein "Tyrosine" )
        , ( "UAC", Protein "Tyrosine" )
        , ( "UGU", Protein "Cysteine" )
        , ( "UGC", Protein "Cysteine" )
        , ( "UGG", Protein "Tryptophan" )
        , ( "UAA", Stop )
        , ( "UAG", Stop )
        , ( "UGA", Stop )
        ]


proteins : String -> Result Error (List String)
proteins strand =
    String.toList strand
        |> process []


process : List String -> List Char -> Result Error (List String)
process acc chars =
    let
        translate : String -> Maybe (RNA String)
        translate codon =
            Dict.get codon codonCodeMap
    in
    case chars of
        [] ->
            Ok acc
        [ _ ] ->
            Err InvalidCodon
        [ _, _ ] ->
            Err InvalidCodon
        x :: y :: z :: reast ->
            case 
                String.fromList [ x, y, z ] 
                    |> translate 
            of
                Just Stop ->
                    Ok acc
                Just (Protein name) ->
                    process (acc ++ [ name ]) reast
                Nothing ->
                    Err InvalidCodon
