package birdwatcher

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) int {
	if len(birdsPerDay) == 0 {
		return 0
	}
	return birdsPerDay[0] + TotalBirdCount(birdsPerDay[1:])
}

const daysPerWeek int = 7

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) int {
	counter := 0
	start := (week - 1) * daysPerWeek
	end := start + daysPerWeek
	for i := start; i < end && i < len(birdsPerDay); i++ {
		counter += birdsPerDay[i]
	}
	return counter
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
	for i := 0; i < len(birdsPerDay); i += 2 {
		birdsPerDay[i] += 1
	}
	return birdsPerDay
}
