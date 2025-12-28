module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    case name of
        Just aName ->
            "One for " ++ aName ++ ", one for me."
        Nothing ->
            "One for you, one for me."
