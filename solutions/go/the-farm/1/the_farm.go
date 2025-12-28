package thefarm

import (
	"errors"
	"fmt"
)

// TODO: define the 'DivideFood' function
func DivideFood(fc FodderCalculator, numberOfCows int) (float64, error) {
	amo, err := fc.FodderAmount(numberOfCows)
	if err != nil {
		return 0, err
	}
	fac, err := fc.FatteningFactor()
	if err != nil {
		return 0, err
	}
	return amo * fac / float64(numberOfCows), nil
}

// TODO: define the 'ValidateInputAndDivideFood' function
func ValidateInputAndDivideFood(fc FodderCalculator, numberOfCows int) (float64, error) {
	if numberOfCows <= 0 {
		return 0, errors.New("invalid number of cows")
	}
	return DivideFood(fc, numberOfCows)
}

// TODO: define the 'ValidateNumberOfCows' function
type InvalidCowsError struct {
	numberOfCows  int
	customMessage string
}

func (e *InvalidCowsError) Error() string {
	return fmt.Sprintf("%d cows are invalid: %s", e.numberOfCows, e.customMessage)
}

func ValidateNumberOfCows(numberOfCows int) error {
	if numberOfCows < 0 {
		return &InvalidCowsError{numberOfCows, "there are no negative cows"}
	}
	if numberOfCows == 0 {
		return &InvalidCowsError{numberOfCows, "no cows don't need food"}
	}
	return nil
}
