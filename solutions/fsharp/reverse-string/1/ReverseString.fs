module ReverseString

let reverse (input: string): string = 
    {String.length input - 1 .. -1 .. 0}
        |> Seq.map (fun idx -> input[idx])
        |> Seq.toArray 
        |> (fun arr -> new string (arr))
