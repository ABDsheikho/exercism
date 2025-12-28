package matrix

import (
	"errors"
	"strconv"
	"strings"
)

// Define the Matrix type here.
type Matrix [][]int

func New(s string) (Matrix, error) {
	chars := splitToChars(s)
	vals, err := parseInts(chars)
	if err != nil {
		return Matrix{}, err
	}
	return vals, nil
}

// Cols and Rows must return the results without affecting the matrix.
func (m Matrix) Cols() [][]int {
	return transpose(m)
}

func (m Matrix) Rows() [][]int {
	n := make([][]int, len(m))
	for irow, row := range m {
		n[irow] = make([]int, len(row))
		for icol, val := range row {
			n[irow][icol] = val
		}
	}
	return n
}

func (m Matrix) Set(row, col, val int) bool {
	if row < 0 || len(m) <= row {
		return false
	}
	if col < 0 || len(m[0]) <= col {
		return false
	}
	m[row][col] = val
	return true
}

func splitToChars(s string) [][]string {
	lines := strings.Split(s, "\n")
	rows := make([][]string, len(lines))

	for idx, line := range lines {
		rows[idx] = strings.Split(strings.TrimSpace(line), " ")
	}
	return rows
}

func parseInts(chars [][]string) ([][]int, error) {
	numOfCols := len(chars[0])
	mInts := make([][]int, len(chars))

	for irow, row := range chars {
		if len(row) != numOfCols {
			return [][]int{}, errors.New("Matrix is not rectangular")
		}

		intsPerCols := make([]int, len(row))
		for icol, col := range row {
			val, err := strconv.Atoi(col)
			if err != nil {
				return [][]int{}, err
			}
			intsPerCols[icol] = val
		}
		mInts[irow] = intsPerCols
	}
	return mInts, nil
}

func transpose[T any](m [][]T) [][]T {
	t := make([][]T, len(m[0]))

	for idx := range t {
		t[idx] = make([]T, len(m))
	}

	for i, arr := range m {
		for j, val := range arr {
			t[j][i] = val
		}
	}
	return t
}
