module PerfectNumbers

type Classification = Perfect | Abundant | Deficient 


let classify num : Classification option = 
    if num < 1 then
        None
    else
        let sumOfFactors = [for i in 1 .. num / 2 do if num % i = 0 then i] |> List.sum
        if num < sumOfFactors then Some Abundant
        elif num > sumOfFactors then Some Deficient
        else Some Perfect
