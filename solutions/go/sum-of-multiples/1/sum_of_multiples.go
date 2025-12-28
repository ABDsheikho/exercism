package summultiples

func SumMultiples(limit int, divisors ...int) int {
	// early return for special use cases
	switch {
	case len(divisors) == 0:
		return 0
	case limit == 0:
		return 0
	}

	// using map's keys as Set to filter duplicated values
	uniqueSet := make(map[int]bool, limit)

	for _, div := range divisors {
		if div <= 0 {
			// infinite loop guard
			continue
		}
		for inc := div; inc < limit; inc += div {
			uniqueSet[inc] = true
		}
	}

	sum := 0

	for key := range uniqueSet {
		sum += key
	}
	return sum
}
