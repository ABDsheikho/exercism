package grains

import (
	"errors"
)

func Square(number int) (uint64, error) {
	if number < 1 || number > 64 {
		return 0, errors.New("number is not in range from 1 to 64")
	}
	return 1 << (number - 1), nil
}

func Total() (t uint64) {
	return ^t // 0b00 => 0b11
}
