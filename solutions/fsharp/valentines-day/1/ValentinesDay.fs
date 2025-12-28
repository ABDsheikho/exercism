module ValentinesDay

type Approval =
    | Yes
    | No
    | Maybe

type Cuisine =
    | Korean
    | Turkish

type Genre =
    | Crime
    | Horror
    | Romance
    | Thriller

type Activity =
    | BoardGame
    | Chill
    | Movie of Genre
    | Restaurant of Cuisine
    | Walk of int

let rateActivity (activity: Activity): Approval = 
    match activity with
    | BoardGame -> No
    | Chill -> No
    | Movie g -> 
        match g with
        | Romance -> Yes
        | _ -> No
    | Restaurant c ->
        match c with
        | Korean -> Yes
        | Turkish -> Maybe
    | Walk distance ->
        match distance with
        | distance when distance < 3 -> Yes
        | distance when distance < 5 -> Maybe
        | _ -> No

