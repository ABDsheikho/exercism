module DifferenceOfSquares

let squareOfSum (number: int): int = 
    let res = (number * (number + 1) / 2)
    res * res

let sumOfSquares (number: int): int = 
    number * (number + 1) * (2 * number + 1) / 6

let differenceOfSquares (number: int): int = 
    squareOfSum number - sumOfSquares number