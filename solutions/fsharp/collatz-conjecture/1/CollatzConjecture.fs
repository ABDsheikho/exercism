module CollatzConjecture

let steps (number: int): int option = 
    let rec collatzHelper counter number =
        if number = 1 then
            Some counter
        elif number % 2 = 0 then
            collatzHelper (counter+1) (number / 2)
        else
            collatzHelper (counter+1) (3*number+1)
    if number <= 0 then
        None
    else
        collatzHelper 0 number