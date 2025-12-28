module Bob exposing (hey)


hey : String -> String
hey remark =
    if endWithQuestionMark remark && allCaps remark then
        "Calm down, I know what I'm doing!"
    else if endWithQuestionMark remark then
        "Sure."
    else if allCaps remark then
        "Whoa, chill out!"
    else if isSilence remark then
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