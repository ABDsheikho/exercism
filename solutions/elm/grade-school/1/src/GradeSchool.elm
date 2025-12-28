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
                (Maybe.map2 (\x lst -> lst ++ [ x ]) <| Just student)
                school
            )


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    Dict.get grade school
        |> Maybe.withDefault []
        |> List.sort


allStudents : School -> List Student
allStudents school =
    Dict.values school
        |> List.map List.sort
        |> List.concat
