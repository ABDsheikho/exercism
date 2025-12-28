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
    List.foldl (\x acc -> if List.member x acc then acc else x::acc) [] elements
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
    let
        compUnion : List a -> List a -> List a -> List a
        compUnion list1 list2 acc =
            case list1 of
                [] ->
                     List.reverse acc ++ list2
                head::tail ->
                    if List.member head list2 then
                        compUnion
                            tail
                            (List.filter (\x -> x /= head) list2)
                            (head::acc)
                    else
                        compUnion tail list2 (head::acc)
    in
    compUnion set1 set2 []
        |> Set


intersect : Set -> Set -> Set
intersect (Set set1) (Set set2) =
    let
        compIntersect : List a -> List a -> List a -> List a
        compIntersect list1 list2 acc =
            case list1 of
                [] ->
                     List.reverse acc
                head::tail ->
                    if List.member head list2 then
                        compIntersect
                            tail
                            (List.filter (\x -> x /= head) list2)
                            (head::acc)
                    else
                        compIntersect tail list2 acc
    in
    compIntersect set1 set2 []
        |> Set


diff : Set -> Set -> Set
diff (Set set1) (Set set2) =
    let
        compDiff : List a -> List a -> List a -> List a
        compDiff list1 list2 acc =
            case list1 of
                [] ->
                     List.reverse acc
                head::tail ->
                    if List.member head list2 then
                        compDiff tail list2 acc
                    else
                        compDiff tail list2 (head::acc)
    in
    compDiff set1 set2 []
        |> Set


subset : Set -> Set -> Bool
subset (Set set1) (Set set2) =
    List.map (\x -> List.member x set2) set1
        |> List.all identity


disjoint : Set -> Set -> Bool
disjoint set1 set2 =
    case 
        intersect set1 set2
            |> toList
    of
        [] -> True
        _ -> False