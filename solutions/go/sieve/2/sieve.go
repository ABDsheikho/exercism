package sieve

import (
	"slices"
)

func Sieve(limit int) []int {
	notComposites := make([]bool, limit+1)
	primes := make([]int, limit/2+1)

	idxCounter := 0
	for idx := 2; idx <= limit; idx++ {
		if notComposites[idx] {
			continue
		}
		primes[idxCounter] = idx
		idxCounter++
		for j := idx * idx; j <= limit; j += idx {
			notComposites[j] = true
		}
	}

	return slices.DeleteFunc(primes, func(n int) bool {
		return n == 0
	})
}
