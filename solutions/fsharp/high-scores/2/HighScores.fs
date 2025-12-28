module HighScores

let scores: int list -> int list = id

let latest: int list -> int = List.last

let personalBest: int list -> int = List.max

let personalTopThree: int list -> int list = 
    List.sortDescending >> List.truncate 3
