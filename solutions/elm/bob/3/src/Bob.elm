module Bob exposing (hey)


hey : String -> String
hey remark =
    let
        qMark = endWithQuestionMark remark
        alCap = allCaps remark
        isSil = isSilence remark
    in
    case (qMark, alCap, isSil) of
        (True, True, _) ->
            "Calm down, I know what I'm doing!"
        (True, False, _) ->
            "Sure."
        (False, True, _) ->
            "Whoa, chill out!"
        (False, False, True) ->
            "Fine. Be that way!"
        (False, False, False) ->
            "Whatever."


endWithQuestionMark : String -> Bool
endWithQuestionMark str =
    String.endsWith "?" (String.trimRight str)


allCaps : String -> Bool
allCaps str =
    let
        alphaStr = String.filter Char.isAlpha str
    in
    if alphaStr == "" then
        False
    else
        String.all Char.isUpper alphaStr


isSilence : String -> Bool
isSilence str =
    String.trim str == ""