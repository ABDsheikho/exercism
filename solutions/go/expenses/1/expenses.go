package expenses

import (
	"errors"
	"slices"
)

// Record represents an expense record.
type Record struct {
	Day      int
	Amount   float64
	Category string
}

// DaysPeriod represents a period of days for expenses.
type DaysPeriod struct {
	From int
	To   int
}

// Filter returns the records for which the predicate function returns true.
func Filter(recs []Record, predicate func(Record) bool) []Record {
	return slices.DeleteFunc(
		slices.Clone(recs), // DeleteFunc modify slice in-place, a clone assure new slice is returned
		func(rec Record) bool { return !predicate(rec) },
	)
}

// ByDaysPeriod returns predicate function that returns true when
// the day of the record is inside the period of day and false otherwise.
func ByDaysPeriod(p DaysPeriod) func(Record) bool {
	return func(rec Record) bool {
		return p.From <= rec.Day && rec.Day <= p.To
	}
}

// ByCategory returns predicate function that returns true when
// the category of the record is the same as the provided category
// and false otherwise.
func ByCategory(c string) func(Record) bool {
	return func(rec Record) bool {
		return rec.Category == c
	}
}

// TotalByPeriod returns total amount of expenses for records
// inside the period p.
func TotalByPeriod(recs []Record, p DaysPeriod) float64 {
	filteredRecs := Filter(recs, ByDaysPeriod(p))
	sum := 0.0
	for _, val := range filteredRecs {
		sum += val.Amount
	}
	return sum
}

// CategoryExpenses returns total amount of expenses for records
// in category c that are also inside the period p.
// An error must be returned only if there are no records in the list that belong
// to the given category, regardless of period of time.
func CategoryExpenses(recs []Record, p DaysPeriod, c string) (float64, error) {
	catRec := Filter(recs, ByCategory(c))
	if len(catRec) == 0 {
		return 0, errors.New("unknown category entertainment")
	}
	return TotalByPeriod(catRec, p), nil
}
