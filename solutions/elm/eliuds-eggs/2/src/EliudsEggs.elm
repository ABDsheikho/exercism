module EliudsEggs exposing (eggCount)


eggCount : Int -> Int
eggCount n =
    countOnes n 0

-- the problem basicly is converting a decimal number to binary
-- but then count the number of reminder
-- and apply the function recursively until the result is 0
-- meaning that last number was 1 and it's over
countOnes : Int -> Int -> Int
countOnes number counter =
    let
        result = number // 2
        reminder = modBy 2 number
    in
    if result == 0 then
        counter + reminder
    else
        countOnes result (counter + reminder)