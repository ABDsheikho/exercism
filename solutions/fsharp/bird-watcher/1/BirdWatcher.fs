module BirdWatcher

let lastWeek: int[] =
    [| 0; 2; 5; 3; 7; 8; 4 |]

let yesterday(counts: int[]): int =
    let idx = Array.length counts - 2
    counts[idx]

let total(counts: int[]): int =
    Array.sum counts

let dayWithoutBirds(counts: int[]): bool =
    Array.contains 0 counts

let incrementTodaysCount(counts: int[]): int[] =
    let lastIndex = Array.length counts - 1
    counts[lastIndex] <- counts[lastIndex] + 1
    counts

let unusualWeek(counts: int[]): bool =
    match counts with
    | [| _; 0; _; 0; _; 0; _ |]
    | [| _; 10; _; 10; _; 10; _ |]
    | [| 5; _; 5; _; 5; _; 5 |] -> true
    | _ -> false
