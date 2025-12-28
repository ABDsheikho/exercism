module ValentinesDay exposing (..)


type Approval 
    = Yes
    | No
    | Maybe

type Cuisine
    = Korean
    | Turkish

type Genre
    = Crime
    | Horror
    | Romance
    | Thriller

type Activity
    = BoardGame
    | Chill
    | Movie Genre
    | Restaurant Cuisine


rateActivity : Activity -> Approval
rateActivity activity =
    case activity of
        BoardGame ->
            No
        Chill ->
            No
        Movie g->
            if g == Romance then
                Yes
            else
                No
          -- or using case  
          --  case g of
          --    Romance -> Yes
          --    _ -> No        -- default value
        Restaurant c ->
            case c of
                Korean -> Yes
                Turkish -> Maybe
            
