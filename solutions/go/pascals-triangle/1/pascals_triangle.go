// pascal package computes the pascal triangle using Triangle function.
// It also has Row and BinomialCoefficient functions that helps Triangle
// to get computed.
package pascal

import (
	"errors"
)

var BoundaryError error = errors.New("Arguments are out off boundaries.")

func Triangle(n int) [][]int {
	if n == 1 {
		return [][]int{{1}}
	}
	if n == 2 {
		return [][]int{{1}, {1, 1}}
	}
	tri := make([][]int, n)
	for idx, _ := range tri {
		rw, _ := Row(idx)
		tri[idx] = rw
	}
	return tri
}

func Row(r int) ([]int, error) {
	if r < 0 {
		return []int{}, BoundaryError
	}
	row := make([]int, r+1)
	for idx, _ := range row {
		row[idx] = BinomialCoefficient(r, idx)
	}
	return row, nil
}

// BinomialCoefficient calculates the binomial coefficient
// given a number and coefficient, using recursive summation.
//
// note: the result is limited to the integer's size,
// and an integer overflow can easily occur.
// 
// maybe in a future iteration I will use math/big pkg for this
func BinomialCoefficient(n, k int) int {
	v, ok := cache[param{n, k}]
	if ok {
		return v
	}

	if k == 0 || k == n {
		v = 1
		goto CacheIt
	}
	if k < 0 || (n >= 0 && k > n) {
		v = 0
		goto CacheIt
	}
	if n < 0 {
		v = BinomialCoefficient(n+1, k) - BinomialCoefficient(n, k-1)
		goto CacheIt
	}
	v = BinomialCoefficient(n-1, k) + BinomialCoefficient(n-1, k-1)

CacheIt:
	cacheIt(param{n, k}, v, cache)
	return v
}

func cacheIt(key param, val int, record map[param]int) {
	record[key] = val
}

// using caching technic to speedup the recursive computation of
// BinomialCoefficient
//
// a map of parameter-result pair
var cache map[param]int = map[param]int{
	{0, 0}: 1,
}

// param struct represents the parameter passed to BinomialCoefficient
type param struct {
	n int
	k int
}
