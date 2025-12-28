package techpalace

import "strings"

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
	return "Welcome to the Tech Palace, " + strings.ToUpper(customer)
}

const star string = "*"

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
    stars := strings.Repeat(star, numStarsPerLine)
    greeting := stars + "\n" + welcomeMsg + "\n" + stars
	return greeting
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	withoutStars := strings.ReplaceAll(oldMsg, star, "")
	return strings.TrimSpace(withoutStars)
}
