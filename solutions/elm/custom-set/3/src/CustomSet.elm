module CustomSet exposing (diff, disjoint, empty, equal, fromList, insert, intersect, isEmpty, member, subset, toList, union)


type Set
    = Set (List Int)


empty : Set
empty =
    Set []


insert : Int -> Set -> Set
insert element (Set set) =
    if List.member element set then
        Set set

    else
        element :: set
            |> List.sort
            |> Set


toList : Set -> List Int
toList (Set set) =
    set


fromList : List Int -> Set
fromList elements =
    let
        insertUnique val acc = 
            if List.member val acc then 
                acc

            else 
                val :: acc
    in
    List.foldl insertUnique [] elements
        |> List.reverse
        |> Set


isEmpty : Set -> Bool
isEmpty (Set set) =
    set == []


member : Int -> Set -> Bool
member element (Set set) =
    List.member element set


equal : Set -> Set -> Bool
equal (Set set1) (Set set2) =
    List.sort set1 == List.sort set2


union : Set -> Set -> Set
union (Set set1) (Set set2) =
    set1 ++ set2
        |> fromList


intersect : Set -> Set -> Set
intersect (Set set1) (Set set2) =
    List.filter (\x -> List.member x set2) set1
        |> fromList


diff : Set -> Set -> Set
diff (Set set1) (Set set2) =
    List.filter (\x -> not <| List.member x set2) set1
        |> fromList


subset : Set -> Set -> Bool
subset (Set set1) (Set set2) =
    List.map (\x -> List.member x set2) set1
        |> List.all identity


disjoint : Set -> Set -> Bool
disjoint set1 set2 =
    intersect set1 set2
        |> isEmpty
