module Yacht exposing (Category(..), score)

import Dict


type Category
    = Ones
    | Twos
    | Threes
    | Fours
    | Fives
    | Sixes
    | FullHouse
    | FourOfAKind
    | LittleStraight
    | BigStraight
    | Choice
    | Yacht


score : List Int -> Category -> Int
score dice category =
    case category of
        Ones ->
            scoreOnes dice
        Twos ->
            scoreTwos dice
        Threes ->
            scoreThrees dice
        Fours ->
            scoreFours dice
        Fives ->
            scoreFives dice
        Sixes ->
            scoreSixes dice
        FullHouse ->
            scoreFullHouse dice
        FourOfAKind ->
            scoreFourOfAKind dice
        LittleStraight ->
            scoreLittleStraight dice
        BigStraight ->
            scoreBigStraight dice
        Choice ->
            scoreChoice dice
        Yacht   ->
            scoreYacht dice


-- a function for each category 

scoreOnes : List Int -> Int
scoreOnes dices =
    calcFor 1 dices


scoreTwos : List Int -> Int
scoreTwos dices =
    calcFor 2 dices


scoreThrees : List Int -> Int
scoreThrees dices =
    calcFor 3 dices


scoreFours : List Int -> Int
scoreFours dices =
    calcFor 4 dices


scoreFives : List Int -> Int
scoreFives dices =
    calcFor 5 dices


scoreSixes : List Int -> Int
scoreSixes dices =
    calcFor 6 dices


scoreFullHouse : List Int -> Int
scoreFullHouse dices =
    calcHouse FullHouse dices


scoreFourOfAKind : List Int -> Int
scoreFourOfAKind dices =
    calcHouse FourOfAKind dices


scoreLittleStraight : List Int -> Int
scoreLittleStraight dices =
    calcStright LittleStraight dices


scoreBigStraight : List Int -> Int
scoreBigStraight dices =
    calcStright BigStraight dices


scoreChoice : List Int -> Int
scoreChoice dices =
    List.sum dices


scoreYacht : List Int -> Int
scoreYacht dices =
    calcHouse Yacht dices


-- the logic behind most of them

calcFor : Int -> List Int -> Int
calcFor dice dices = 
    dices
        |> List.filter ((==) dice)
        |> List.length
        |> (*) dice


calcHouse : Category -> List Int -> Int
calcHouse category dices =
    let
        foldToDict key dict =
            Dict.update
                key
                (Maybe.map ((+) 1) >> Maybe.withDefault 1 >> Just)
                dict

        counts =
            List.foldl foldToDict Dict.empty dices
                |> Dict.toList
                |> List.map (\( x, y ) -> ( y, x ))
                |> List.sort
    in
    case ( category, counts ) of
        ( FullHouse, [ ( 2, _ ), ( 3, _ ) ] ) ->
            List.sum dices

        ( FourOfAKind, [ ( 1, _ ), ( 4, v ) ] ) ->
            4 * v

        ( FourOfAKind, [ ( 5, v ) ] ) ->
            4 * v

        ( Yacht, [ ( 5, _ ) ] ) ->
            50

        _ ->
            0


calcStright category dices =
    case ( category, List.sort dices ) of
        ( LittleStraight, [ 1, 2, 3, 4, 5 ] ) ->
            30

        ( BigStraight, [ 2, 3, 4, 5, 6 ] ) ->
            30

        _ ->
            0
