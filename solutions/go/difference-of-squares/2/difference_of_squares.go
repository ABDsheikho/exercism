package diffsquares

func SquareOfSum(n int) int {
	val := n * (n + 1) / 2
	return val * val
}

func SumOfSquares(n int) int {
	return n * (n + 1) * (2*n + 1) / 6
}

func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
