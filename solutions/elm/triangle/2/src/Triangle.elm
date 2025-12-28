module Triangle exposing (Triangle(..), triangleKind)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : number -> number -> number -> Result String Triangle
triangleKind x y z =
    validateLength x y z
        |> Result.andThen validateTriangle
        |> Result.andThen classifyTriangle


validateLength :
    number
    -> number
    -> number
    -> Result String ( number, number, number )
validateLength x y z =
    case ( x > 0, y > 0, z > 0 ) of
        ( True, True, True ) ->
            Ok ( x, y, z )

        _ ->
            Err "Invalid lengths"


validateTriangle :
    ( number, number, number )
    -> Result String ( number, number, number )
validateTriangle ( x, y, z ) =
    case ( (x + y) >= z, (y + z) >= x, (z + x) >= y ) of
        ( True, True, True ) ->
            Ok ( x, y, z )

        _ ->
            Err "Violates inequality"


classifyTriangle :
    ( number, number, number )
    -> Result String Triangle
classifyTriangle ( x, y, z ) =
    case ( x == y, y == z, z == x ) of
        ( True, True, True ) ->
            Ok Equilateral

        ( False, False, False ) ->
            Ok Scalene

        _ ->
            Ok Isosceles
