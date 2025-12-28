module PizzaPricing

type Pizza =
    | Margherita
    | Caprese
    | Formaggio
    | ExtraSauce of Pizza
    | ExtraToppings of Pizza


let rec pizzaPrice (pizza: Pizza): int = 
    match pizza with
    | Margherita -> 7
    | Caprese -> 9
    | Formaggio -> 10
    | ExtraSauce somePizza -> 1 + pizzaPrice somePizza
    | ExtraToppings somePizza -> 2 + pizzaPrice somePizza
    

let orderPrice (pizzas: Pizza list): int = 
    let fee = 
        match List.length pizzas with
        | 1 -> 3
        | 2 -> 2
        | _ -> 0
    pizzas
    |> List.fold (fun acc x -> pizzaPrice x + acc) fee
