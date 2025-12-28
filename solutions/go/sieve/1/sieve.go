package sieve

import (
	"slices"
)

func Sieve(limit int) []int {
	limit++ // to include the last value in both arrays and loops
	primes := make([]int, limit/2)
	numbers := rangeSequence(0, limit, 1)

	idxCounter := 0
	for i := 0; i < limit; i++ {
		if numbers[i] == 0 || numbers[i] == 1 {
			continue
		}

		primes[idxCounter] = numbers[i]
		idxCounter++
		for j := numbers[i] * numbers[i]; j < limit; j += numbers[i] {
			numbers[j] = 0
		}
	}
	return slices.DeleteFunc(primes, func(n int) bool {
		return n == 0
	})
}

func rangeSequence(start, end, step int) []int {
	s := make([]int, end-start)

	for i := start; i < end; i += step {
		s[i-start] = i
	}
	return s
}
