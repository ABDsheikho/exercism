module GradeSchool exposing (Grade, Result(..), School, Student, addStudent, allStudents, emptySchool, studentsInGrade)

import Dict exposing (..)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Int (List Student)


type Result
    = Added
    | Duplicate


emptySchool : School
emptySchool =
    Dict.empty


addStudent : Grade -> Student -> School -> ( Result, School )
addStudent grade student school =
    let
        doExists =
            List.member student <| allStudents school

        mybStudents =
            Dict.get grade school
    in
    case ( doExists, mybStudents ) of
        ( True, _ ) ->
            ( Duplicate, school )

        ( False, Nothing ) ->
            ( Added, Dict.insert grade [ student ] school )

        ( False, Just _ ) ->
            ( Added
            , Dict.update grade
                ( Maybe.map (\lst -> lst ++ [ student ]) )
                school
            )



{-
    appending `student` to the end of the list reserves the sort
    in which every student got added `sortByTimeOfAdding`, whereas
    sorting the list while appending removes this information completely.

    Yes it means that every time you request the list
    it have to be sorted, but that's my opinion.

    Otherwise it would be more idiomatic to apply:

        ( Maybe.map ((::) student) )

    And I'm in favor of separating `insert` functionality from `update`
    functionality, otherwise the whole case-statement would be:

    case doExists of
        True ->
            ( Duplicate, school )
        False ->
            ( Added
            , Dict.update grade
                (Maybe.map (\lst -> lst ++ [ student ])
                    >> Maybe.withDefault [ student ]
                    >> Just
                )
                school
            )

-}


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    Dict.get grade school
        |> Maybe.withDefault []
        |> List.sort


allStudents : School -> List Student
allStudents school =
    Dict.values school
        |> List.concatMap List.sort
