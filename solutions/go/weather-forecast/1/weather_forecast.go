// Package weather deals with weather infromation
// and can export CurrentCondition, CurrentLocation, Forecast.
package weather

// CurrentCondition describe the current weather condition.
var CurrentCondition string

// CurrentLocation describe the current location.
var CurrentLocation string

// Forecast returns current weather condition at your current location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
