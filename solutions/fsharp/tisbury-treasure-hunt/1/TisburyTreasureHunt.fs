module TisburyTreasureHunt


let getCoordinate (line: string * string): string =
    snd line


let charToInt (letter : char) = int letter - int '0'


let convertCoordinate (coordinate: string): int * char = 
    let num = charToInt coordinate[0] 
    let add = coordinate[1]
    num, add


let compareRecords 
    (azarasData: string * string) 
    (ruisData: string * (int * char) * string) 
    : bool =
    let _, coor1 = azarasData
    let _, coor2, _ = ruisData
    coor2 = convertCoordinate coor1


let createRecord 
    (azarasData: string * string) 
    (ruisData: string * (int * char) * string) 
    : (string * string * string * string) =
    if compareRecords azarasData ruisData then
        let treasure, coordinate = azarasData
        let location, _, quadrant = ruisData
        coordinate, location, quadrant, treasure
    else
        "","","",""
