package chance

import (
	v2 "math/rand/v2"
	"slices"
)

var animals []string = []string{"ant", "beaver", "cat", "dog", "elephant", "fox", "giraffe", "hedgehog"}

// RollADie returns a random int d with 1 <= d <= 20.
func RollADie() int {
	return v2.IntN(20) + 1
}

// GenerateWandEnergy returns a random float64 f with 0.0 <= f < 12.0.
func GenerateWandEnergy() float64 {
	return v2.Float64() * 12
}

// ShuffleAnimals returns a slice with all eight animal strings in random order.
func ShuffleAnimals() []string {
	newAnimals := slices.Clone(animals)
	v2.Shuffle(len(newAnimals), func(i, j int) {
		newAnimals[i], newAnimals[j] = newAnimals[j], newAnimals[i]
	})
	return newAnimals
}
