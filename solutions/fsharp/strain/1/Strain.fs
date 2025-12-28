module Seq

let partition (pred: ('a -> bool)) (xs: seq<'a>): seq<'a> * seq<'a> =
    let folder (acc1, acc2) xs =
        if pred xs then
            (Seq.append acc1 [xs], acc2)
        else
            (acc1, Seq.append acc2 [xs])
    Seq.fold folder (Seq.empty, Seq.empty) xs

let keep (pred: ('a -> bool)) (xs: seq<'a>): seq<'a> = 
    partition pred xs |> fst

let discard (pred: ('a -> bool)) (xs: seq<'a>): seq<'a> = 
    partition pred xs |> snd
