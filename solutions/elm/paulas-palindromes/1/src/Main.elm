module Main exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput)



-- When you have finished this exercise, this file will be an Elm program.
--
-- You can copy this file to Ellie (an online Elm sandbox - https://ellie-app.com/)
-- to see it running and interact with it.
--
-- If you are solving the exercise locally (and not through the exercism online editor),
-- you can additionally run it locally:
-- - `rm src/Browser.elm` (delete a fake file that we need for the online editor),
-- - `elm install elm/browser` (install the real version of the fake)
-- - `npx elm-watch@beta hot` (compile the code, hot reload and serve)
-- - Then go to the url in the output to view the application (localhost://53529 or similar)
-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }




-- MODEL


type alias Model =
    { content : String }


init =
    { content = "" }



-- UPDATE


type Msg
    = Change String


update msg model =
    case msg of
        Change txt ->
            { model | content = txt }



-- VIEW


view model =
    Html.div []
        [ Html.input
            [ Html.Attributes.placeholder "Text to reverse"
            , Html.Attributes.value model.content
            , Html.Events.onInput Change
            ]
            []
        , Html.div [] [ Html.text (palindromeCheck model.content) ]
        ]


palindromeCheck : String -> String
palindromeCheck txt =
    case txt == String.reverse txt of
        True ->
            "This is a palindrome"

        False ->
            "Not a palindrome"
