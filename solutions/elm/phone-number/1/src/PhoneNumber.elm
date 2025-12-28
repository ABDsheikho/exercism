module PhoneNumber exposing (getNumber)

import Regex exposing (Regex)


getNumber : String -> Maybe String
getNumber phoneNumber =
    phoneNumber
        |> String.filter Char.isDigit
        |> validateCountryCode 10 "1"
        |> Maybe.andThen
            (validatePhoneNumberStructure "^[2-9]\\d{2}[2-9]\\d{2}\\d{4}$")


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


validatePhoneNumberStructure : String -> String -> Maybe String
validatePhoneNumberStructure pattern phoneNumber =
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
