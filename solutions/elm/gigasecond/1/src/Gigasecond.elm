module Gigasecond exposing (add)

import Time


add : Time.Posix -> Time.Posix
add timestamp =
    Time.posixToMillis timestamp
        |> (+) ( 10 ^ 12 )
        |> Time.millisToPosix 
