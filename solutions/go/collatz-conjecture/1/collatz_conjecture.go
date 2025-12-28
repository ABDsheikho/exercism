package collatzconjecture

import "errors"

func CollatzConjecture(n int) (int, error) {
	if n <= 0 {
		return 0, errors.New("")
	}
	steps := 0
	for n != 1 {
		switch {
		case n%2 == 0:
			n = n / 2
		default:
			n = 3*n + 1
		}
		steps++
	}
	return steps, nil
}
