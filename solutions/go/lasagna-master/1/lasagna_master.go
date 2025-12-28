package lasagna

// Preparation Time computes the preparation time needed to prepare lasagna
// layers according to an average preparation time for one layer.
func PreparationTime(layers []string, avgTimePerLayer int) int {
	if avgTimePerLayer == 0 {
		return len(layers) * 2
	}
	return len(layers) * avgTimePerLayer
}

const gramsPerNoodles int = 50
const litersPerSauce float64 = 0.2

// Quantities computes the amount of noodles and souce needed for the
// lasagna dish in grams and liters, respectively.
func Quantities(layers []string) (noodles int, sauce float64) {
	for _, val := range layers {
		if val == "noodles" {
			noodles++
		}
		if val == "sauce" {
			sauce++
		}
	}
	return noodles * gramsPerNoodles, sauce * litersPerSauce
}

// AddSecretIngredient adds the secret ingredient from friend's recipe
// into your recipe.
func AddSecretIngredient(friendRecipe, myRecipe []string) {
	myRecipe[len(myRecipe)-1] = friendRecipe[len(friendRecipe)-1]
}

// ScaleRecipe takes reicpe portions that are made for two people,
// and scale them into any number of people.
func ScaleRecipe(amountsPerTwo []float64, scale int) []float64 {
	scaledPortions := make([]float64, len(amountsPerTwo))
	for idx, val := range amountsPerTwo {
		scaledPortions[idx] = val * float64(scale) / 2.0
	}
	return scaledPortions
}
