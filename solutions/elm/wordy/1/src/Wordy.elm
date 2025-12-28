module Wordy exposing (answer)

import Parser exposing ((|.), (|=), Parser)


type Operation
    = Addition Int
    | Subtraction Int
    | Multiplication Int
    | Division Int


type Arithmetic
    = Arithmetic Int (List Operation)


parseNumber : Parser Int
parseNumber =
    Parser.oneOf
        [ Parser.succeed identity
            |= Parser.int
        , Parser.succeed negate
            |. Parser.symbol "-"
            |= Parser.int
        ]


parseOperation : Parser Operation
parseOperation =
    Parser.oneOf
        [ Parser.succeed Addition
            |. Parser.spaces
            |. Parser.keyword "plus"
            |. Parser.spaces
            |= parseNumber
        , Parser.succeed Subtraction
            |. Parser.keyword "minus"
            |. Parser.spaces
            |= parseNumber
        , Parser.succeed Multiplication
            |. Parser.keyword "multiplied by"
            |. Parser.spaces
            |= parseNumber
        , Parser.succeed Division
            |. Parser.keyword "divided by"
            |. Parser.spaces
            |= parseNumber
        ]


parseOperationsByLooping :
    List Operation
    -> Parser (Parser.Step (List Operation) (List Operation))
parseOperationsByLooping revOperations =
    Parser.oneOf
        [ Parser.succeed (\op -> Parser.Loop (op :: revOperations))
            |= parseOperation
            |. Parser.spaces
        , Parser.succeed ()
            |> Parser.map (\_ -> Parser.Done (List.reverse revOperations))
        ]


chainedOperations : Parser (List Operation)
chainedOperations =
    Parser.loop [] parseOperationsByLooping


parseExpression : Parser Arithmetic
parseExpression =
    Parser.succeed Arithmetic
        |= parseNumber
        |. Parser.spaces
        |= chainedOperations


parseQuestion : Parser Arithmetic
parseQuestion =
    Parser.succeed identity
        |. Parser.keyword "What is"
        |. Parser.spaces
        |= parseExpression
        |. Parser.symbol "?"
        |. Parser.end


calculate : Int -> List Operation -> Int
calculate initialNumber operations =
    case operations of
        [] ->
            initialNumber

        head :: tail ->
            case head of
                Addition number ->
                    calculate (initialNumber + number) tail

                Subtraction number ->
                    calculate (initialNumber - number) tail

                Multiplication number ->
                    calculate (initialNumber * number) tail

                Division number ->
                    calculate (initialNumber // number) tail


answer : String -> Maybe Int
answer problem =
    Parser.run parseQuestion problem
        |> Result.toMaybe
        |> Maybe.map (\(Arithmetic num opList) -> calculate num opList)
