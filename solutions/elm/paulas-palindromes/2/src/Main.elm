module Main exposing (..)

import Browser exposing (sandbox)
import Html exposing (Html, div, input, text)
import Html.Attributes
import Html.Events



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
    sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { content : String }


init : Model
init =
    { content = "" }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change txt ->
            { model | content = txt }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input
            [ Html.Attributes.placeholder "Text to reverse"
            , Html.Attributes.value model.content
            , Html.Events.onInput Change
            ]
            []
        , div [] [ text (palindromeCheck model.content) ]
        ]


palindromeCheck : String -> String
palindromeCheck txt =
    if txt == String.reverse txt then
        "This is a palindrome"

    else
        "Not a palindrome"
