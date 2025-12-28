module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)


clean1 : String -> String
clean1 str =
    String.replace " " "_" str


clean2 : String -> String
clean2 str =
    let
        newStr = clean1 str
        noTaps = String.replace "\t" "[CTRL]" newStr
        noNewLines = String.replace "\n" "[CTRL]" noTaps
        noNewAgainLines = String.replace "\r" "[CTRL]" noNewLines
    in
    noNewAgainLines


clean3 : String -> String
clean3 str =
    let
        newStr = clean2 str
        words = String.split "-" newStr
    in
    case words of
        [] ->
            newStr
        [one] ->
            one
        x::xs ->
            x ++ (String.join "" (List.map toTitle xs))

toTitle : String -> String
toTitle str =
    let
        firstLetter = String.left 1 str
        rest = String.dropLeft 1 str
    in
    (String.toUpper firstLetter) ++ rest


clean4 : String -> String
clean4 str =
    String.filter (\c -> not (Char.isDigit c)) (clean3 str)


clean : String -> String
clean str =
    let
        newStr = clean4 str
    in
    String.filter (\c -> not (isGreek c)) (clean4 str)

isGreek : Char -> Bool
isGreek char =
    let
        code = Char.toCode char
        lower = Char.toCode 'α'
        upper = Char.toCode 'ω'
    in
    if lower <= code && code <= upper then
        True
    else
        False