package parsinglogfiles

import (
	"fmt"
	"regexp"
	"slices"
	"strings"
)

func IsValidLine(text string) bool {
	// setup regex pattern
	stdLog := []string{"TRC", "DBG", "INF", "WRN", "ERR", "FTL"}

	// the pattern is: `^\[(?:TRC|DBG|INF|WRN|ERR|FTL)\]`
	// non-capturing group --- CRAZY, I KNOW
	pattern := fmt.Sprintf(`^\[(?:%s)\]`, strings.Join(stdLog, "|"))

	// setup regexp type
	re := regexp.MustCompile(pattern)
	return re.MatchString(text)
}

func SplitLogLine(text string) []string {
	// setup regex pattern
	seps := []string{"-", "=", "*", "~"}

	// the pattern is: `<[-=*~]*>`
	pattern := fmt.Sprintf(`<[%s]*>`, strings.Join(seps, ""))

	// setup regexp type
	re := regexp.MustCompile(pattern)
	return re.Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	pattern := `(?i)\".*password.*\"` // hard-coded

	// setup regexp type
	re := regexp.MustCompile(pattern)
	// filter lines based on pattern
	mat := slices.DeleteFunc(
		lines,
		func(s string) bool {
			return !re.MatchString(s)
		},
	)
	return len(mat)
}

func RemoveEndOfLineText(text string) string {
	pattern := `end-of-line\d*` // hard-coded
	re := regexp.MustCompile(pattern)
	return re.ReplaceAllString(text, "")
}

func TagWithUserName(lines []string) []string {
	pattern := `User\s+(\w*)` // hard-coded

	re := regexp.MustCompile(pattern)

	newLines := make([]string, len(lines))

	for idx, line := range lines {
		if mat := re.FindStringSubmatch(line); mat != nil && IsValidLine(line) {
			newLines[idx] = fmt.Sprintf("[USR] %s %s", mat[1], line)
		} else {
			newLines[idx] = line
		}
	}
	return newLines
}
