module PascalsTriangle exposing (rows)


rows : Int -> List (List Int)
rows n =
    List.range 0 (n-1)
    |> List.map singelRow


singelRow : Int -> List Int
singelRow n =
    List.range 0 n
    |> List.map (\i -> binomialCoefficient n i )


binomialCoefficient : Int -> Int -> Int
binomialCoefficient n k =
    if k == 0 || k == n then
        1
    else if k < 0 || (n > k && k > n) then
        0
    else if n < 0 then
        binomialCoefficient n (k-1)
        |> (-) (binomialCoefficient (n+1) k)
    else
        binomialCoefficient (n-1) (k-1)
        |> (+) (binomialCoefficient (n-1) k)
