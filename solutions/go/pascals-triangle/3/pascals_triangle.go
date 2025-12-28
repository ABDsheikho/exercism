// pascal package computes the pascal triangle using Triangle function.
// It also has Row and BinomialCoefficient functions that helps Triangle
// to get computed.
package pascal

import (
	"errors"
	"sync"
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
	value, exists := binCofCache.Load(param{n, k})
	if exists {
        // because value is of type any
		if intVal, ok := value.(int); ok {
			return intVal
		}
	}

	var val int
	defer func() {
		binCofCache.Store(param{n, k}, val)
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
	binCofCache.Store(param{n, k}, val)

	return val
}


// binCofCache is concurrent-safe map that used to cache BinomialCoefficient
// results and access it without the need to recalculate existing results.
// 
// this technic to used speedup the recursive computation of
// BinomialCoefficient.
//
// sync.Map does NOT cast types on its keys and values stored within its
// structure, so the expected types are equivalent to:
// 
// 	var binCofCache map[param]int
// 
var binCofCache sync.Map

// param struct represents the parameter passed to BinomialCoefficient
type param struct {
	n int
	k int
}
