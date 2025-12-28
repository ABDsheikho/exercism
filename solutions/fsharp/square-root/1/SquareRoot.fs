module SquareRoot

let squareRoot n =
    let rec squareRootHelper x0 x1 =
        if x0 <> x1 then
            squareRootHelper x1 <| (x1 + (n / x1)) / 2
        else
            x1

    squareRootHelper (2 * n) n
