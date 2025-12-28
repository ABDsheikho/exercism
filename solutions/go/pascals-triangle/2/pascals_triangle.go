// pascal package computes the pascal triangle using Triangle function.
// It also has Row and BinomialCoefficient functions that helps Triangle
// to get computed.
package pascal

import (
	"errors"
)

var ErrorOutOffBoundary error = errors.New("arguments are out off boundaries")

func Triangle(n int) [][]int {
	if n == 1 {
		return [][]int{{1}}
	}
	if n == 2 {
		return [][]int{{1}, {1, 1}}
	}
	tri := make([][]int, n)
	for idx := range tri {
		rw, _ := Row(idx)
		tri[idx] = rw
	}
	return tri
}

func Row(r int) ([]int, error) {
	if r < 0 {
		return []int{}, ErrorOutOffBoundary
	}
	row := make([]int, r+1)
	for idx := range row {
		row[idx] = BinomialCoefficient(r, idx)
	}
	return row, nil
}

// BinomialCoefficient calculates the binomial coefficient
// given a number and coefficient, using recursive summation.
//
// note: the result is limited to the integer's size,
// and an integer overflow can easily occur.
func BinomialCoefficient(n, k int) int {
	val, ok := binCofCache[param{n, k}]
	if ok {
		return val
	}

	defer func() {
		binCofCache[param{n, k}] = val
	}()

	switch {
	case k == 0, k == n:
		val = 1
	case k < 0, (n >= 0 && k > n):
		val = 0
	case n < 0:
		val = BinomialCoefficient(n+1, k) - BinomialCoefficient(n, k-1)
	default:
		val = BinomialCoefficient(n-1, k) + BinomialCoefficient(n-1, k-1)
	}

	return val
}

// using caching technic to speedup the recursive computation of
// BinomialCoefficient
//
// a map of parameter-result pair
var binCofCache map[param]int = map[param]int{
	{0, 0}: 1,
}

// param struct represents the parameter passed to BinomialCoefficient
type param struct {
	n int
	k int
}
