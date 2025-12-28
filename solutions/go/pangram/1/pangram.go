package pangram

import "strings"

var engAlphabet []rune = []rune("abcdefghijklmnopqrstuvwxyz")

func setupRecord() map[rune]int {
	// setup record and populate it.
	record := make(map[rune]int, len(engAlphabet))
	for _, char := range engAlphabet {
		record[char] = 0
	}
	return record
}

func IsPangram(input string) bool {
	record := setupRecord()

	// loop over characters and increment recorde
	lower := strings.ToLower(input)
	for _, run := range []rune(lower) {
		record[run] += 1
	}

	// check for unused characters
	for _, val := range record {
		if val < 1 {
			return false
		}
	}
	return true
}
