package pangram

import "strings"

func IsPangram(s string) bool {
	s = strings.ToLower(s)
	for char := 'a'; char <= 'z'; char++ {
		if !strings.ContainsRune(s, char) {
			return false
		}
	}
	return true
}
