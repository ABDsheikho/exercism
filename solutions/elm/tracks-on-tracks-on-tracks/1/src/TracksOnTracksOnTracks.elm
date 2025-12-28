module TracksOnTracksOnTracks exposing (..)

import List exposing (length, reverse, head)

newList : List String
newList = []


existingList : List String
existingList = [ "Elm", "Clojure", "Haskell" ]


addLanguage : String -> List String -> List String
addLanguage language languages =
    language :: languages


countLanguages : List String -> Int
countLanguages languages =
    length languages

reverseList : List String -> List String
reverseList languages =
    reverse languages

excitingList : List String -> Bool
excitingList languages =
    case languages of
        [] ->
            False
        x::xs ->
            if x == "Elm" then
                True
            else if length languages > 1 && length  languages <= 3 then
                case xs of
                    [] ->
                        False
                    xx::xxss ->
                        xx == "Elm"
            else
                False