module Triangle

let isTriangle (triangle: float list) =
    match List.sortDescending triangle with
    | head :: tail when head < List.sum tail && List.length triangle = 3 -> true
    | _ -> false

let distinctSides triangle = List.distinct triangle |> List.length

let equilateral triangle =
    distinctSides triangle = 1 && isTriangle triangle

let isosceles triangle =
    distinctSides triangle <= 2 && isTriangle triangle

let scalene triangle =
    distinctSides triangle = 3 && isTriangle triangle
