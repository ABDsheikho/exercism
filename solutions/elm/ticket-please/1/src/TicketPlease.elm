module TicketPlease exposing (..)

import TicketPleaseSupport exposing (Status(..), Ticket(..), User(..))


emptyComment : ( User, String ) -> Bool
emptyComment (_, comment) =
    comment == ""


numberOfCreatorComments : Ticket -> Int
numberOfCreatorComments (Ticket { createdBy, comments }) =
    let
        (user, _) = createdBy
    in
    comments
    |> List.map (\(userOfComment, _) -> userOfComment)
    |> List.filter ((==) user )
    |> List.length


assignedToDevTeam : Ticket -> Bool
assignedToDevTeam (Ticket {assignedTo}) =
    case assignedTo of
    Just (User "Alice") -> 
        True
    Just (User "Bob") -> 
        True
    Just (User "Charlie") -> 
        True
    _ -> False


-- a comment for future me
-- type alias is different than type *without alias*
-- just like Ticket example
assignTicketTo : User -> Ticket -> Ticket
assignTicketTo user (Ticket ticket) =
    case ticket.status of
    New ->
        Ticket { ticket | assignedTo = Just user, status = InProgress}
    Archived ->
        Ticket ticket
    _ ->
        Ticket { ticket | assignedTo = Just user}
