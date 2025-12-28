module PhoneNumber exposing (getNumber)

import Regex exposing (Regex)


getNumber : String -> Maybe String
getNumber phoneNumber =
    validatePhoneNumber phoneNumber 10 "1" "^[2-9]\\d{2}[2-9]\\d{2}\\d{4}$"


validatePhoneNumber : String -> Int -> String -> String -> Maybe String
validatePhoneNumber phoneNumber figures countryCode pattern =
    phoneNumber
        |> cleanPhoneNumber
        |> Maybe.andThen
            (validateCountryCode figures countryCode)
        |> Maybe.andThen
            (validateStructure pattern)


cleanPhoneNumber : String -> Maybe String
cleanPhoneNumber phoneNumber =
    let
        digits = String.filter Char.isDigit phoneNumber
    in
    case digits of
        "" -> Nothing
        _ -> Just digits


validateCountryCode : Int -> String -> String -> Maybe String
validateCountryCode figures countryCode phoneNumber =
    let
        startWithOne = String.startsWith countryCode phoneNumber
        numberLength = String.length phoneNumber
        codeLength = String.length countryCode
    in
    case
        ( startWithOne
        , numberLength == figures + codeLength
        , numberLength == figures
        )
    of
        ( True, True, False ) ->
            Just <| String.dropLeft codeLength phoneNumber
        ( False, False, True ) ->
            Just phoneNumber
        _ ->
            Nothing


validateStructure : String -> String -> Maybe String
validateStructure pattern phoneNumber =
    let
        match : String -> Regex
        match ptrn =
            Regex.fromString ptrn
                |> Maybe.withDefault Regex.never
    in
    if Regex.contains (match pattern) phoneNumber then
        Just phoneNumber
    else
        Nothing
