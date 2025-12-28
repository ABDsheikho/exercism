module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    collatzLogic 0 start


collatzLogic : Int -> Int -> Result String Int
collatzLogic counter start =
    if start == 1 then
        Ok counter
    else if start <= 0 then
        Err "Only positive integers are allowed"
    else if remainderBy 2 start == 0 then
        collatzLogic (counter + 1) (start // 2)
    else
        collatzLogic (counter + 1) (3 * start + 1)
