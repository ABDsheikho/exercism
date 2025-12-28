package triangle

import (
	"slices"
)

// Notice KindFromSides() returns this type. Pick a suitable data type.
type Kind int

const (
	NaT = iota // not a triangle
	Equ        // equilateral
	Iso        // isosceles
	Sca        // scalene
)

// KindFromSides should have a comment documenting it.
func KindFromSides(a, b, c float64) Kind {
	switch {
	case !isTriangle(a, b, c):
		return NaT
	case isEquilateral(a, b, c):
		return Equ
	case isIsosceles(a, b, c):
		return Iso
	default:
		return Sca
	}
}

func isTriangle(a, b, c float64) bool {
	s := []float64{a, b, c}
	slices.Sort(s)
	slices.Reverse(s)
	return s[0] < (s[1] + s[2])
}

func isEquilateral(a, b, c float64) bool {
	return a == b && a == c
}

func isIsosceles(a, b, c float64) bool {
	return a == b || a == c || b == c
}
