module Bob exposing (hey)


hey : String -> String
hey remark =
    let
        ewqm = endWithQuestionMark remark
        ac = allCaps remark
    in
    case (ewqm, ac) of
    (True, True) ->
        "Calm down, I know what I'm doing!"
    (True, False) ->
        "Sure."
    (False, True) ->
        "Whoa, chill out!"
    (False, False) ->
        if isSilence remark then
            "Fine. Be that way!"
        else
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