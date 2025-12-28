package lasagna

import "fmt"

// TODO: define the 'OvenTime' constant
const OvenTime int = 40

// RemainingOvenTime returns the remaining minutes based on the `actual` minutes already in the oven.
func RemainingOvenTime(actualMinutesInOven int) int {
	return OvenTime - actualMinutesInOven
}

// PreparationTime calculates the time needed to prepare the lasagna based on the amount of layers.
func PreparationTime(numberOfLayers int) int {
	return numberOfLayers * 2
}

// ElapsedTime calculates the time elapsed cooking the lasagna. This time includes the preparation time and the time the lasagna is baking in the oven.
func ElapsedTime(numberOfLayers, actualMinutesInOven int) int {
	pt := PreparationTime(numberOfLayers)
    fmt.Println(pt)
    // ot := RemainingOvenTime(actualMinutesInOven)
    ot := actualMinutesInOven
    // fmt.Println(ot)
    return pt + ot
}
