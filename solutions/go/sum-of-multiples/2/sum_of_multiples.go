package summultiples

func SumMultiples(limit int, divisors ...int) int {
	multiples := make([]int, limit)
	for _, div := range divisors {
		if div == 0 {
			continue
		}
		for i := 0; i < limit; i += div {
			multiples[i] = i
		}
	}

	sum := 0
	for _, val := range multiples {
		sum += val
	}
	return sum
}
