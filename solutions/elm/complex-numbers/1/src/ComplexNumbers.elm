module ComplexNumbers exposing
    ( Complex
    , abs
    , add
    , conjugate
    , div
    , exp
    , fromPair
    , fromReal
    , imaginary
    , mul
    , real
    , sub
    )

import Basics exposing (sqrt, cos, sin, e)

type alias Complex
    = { re : Float, im : Float }


fromPair : ( Float, Float ) -> Complex
fromPair pair =
    let
        (re, im) = pair
    in
    Complex re im


fromReal : Float -> Complex
fromReal float =
    let
        re = float
        im = 0.0
    in
    Complex re im


real : Complex -> Float
real z =
    z.re


imaginary : Complex -> Float
imaginary z =
    z.im


conjugate : Complex -> Complex
conjugate z =
    let
        newIm = -1 * z.im
    in
    {z | im = newIm}


abs : Complex -> Float
abs z =
    sqrt (z.re^2 + z.im^2)


add : Complex -> Complex -> Complex
add z1 z2 =
    let
        re = z1.re + z2.re
        im = z1.re + z1.re
    in
    Complex re im


sub : Complex -> Complex -> Complex
sub z1 z2 =
    let
        re = z1.re - z2.re
        im = z1.re - z1.re
    in
    Complex re im


mul : Complex -> Complex -> Complex
mul z1 z2 =
    let
        re = (z1.re * z2.re) - (z1.im * z2.im)
        im = (z1.re * z2.im) + (z1.im * z2.re)
    in
    Complex re im


div : Complex -> Complex -> Complex
div z1 z2 =
    let
        re = (z1.re * z2.re + z1.im * z2.im)/(z2.re^2 + z2.im^2)
        im = (z1.im * z2.re - z1.re * z2.im)/(z2.re^2 + z2.im^2)
    in
    Complex re im


exp : Complex -> Complex
exp z =
    let
        re = cos(z.im)
        im = sin(z.im)
        z1 = fromReal (e^z.re)
        z2 = Complex re im 
    in
    mul z1 z2
