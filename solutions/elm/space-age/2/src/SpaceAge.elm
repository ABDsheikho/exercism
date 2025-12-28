module SpaceAge exposing (Planet(..), ageOn)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


ageOn : Planet -> Float -> Float
ageOn planet seconds =
    case planet of
        Mercury ->
            (toYear seconds) / 0.2408467
        Venus ->
            (toYear seconds) / 0.61519726 
        Earth ->
            (toYear seconds)
        Mars ->
            (toYear seconds) / 1.8808158 
        Jupiter ->
            (toYear seconds) / 11.862615
        Saturn ->
            (toYear seconds) / 29.447498
        Uranus ->
            (toYear seconds) / 84.016846
        Neptune ->
            (toYear seconds) / 164.79132 

toYear : Float -> Float
toYear seconds = 
    seconds / 31557600





