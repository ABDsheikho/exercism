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
    let
        isValidx = x > 0
        isValidy = y > 0
        isValidz = z > 0
    in
    case ( isValidx, isValidy, isValidz ) of
        ( True, True, True ) ->
            Ok ( x, y, z )
        _ ->
            Err "Invalid lengths"


validateTriangle : 
    ( number, number, number ) 
    -> Result String ( number, number, number )
validateTriangle ( x, y, z ) =
    let
        sideOne = (x + y) >= z
        sideTwo = (y + z) >= x
        sideThree = (z + x) >= y
    in
    case ( sideOne, sideTwo, sideThree ) of
        ( True, True, True ) ->
            Ok ( x, y, z )
        _ ->
            Err "Violates inequality"


classifyTriangle : 
    ( number, number, number ) 
    -> Result String Triangle
classifyTriangle ( x, y, z ) =
    let
        xToy = x == y
        yToz = y == z
        zTox = z == x
    in
    case ( xToy, yToz, zTox ) of
        ( True, True, True ) ->
            Ok Equilateral
        ( False, False, False ) ->
            Ok Scalene
        _ ->
            Ok Isosceles
