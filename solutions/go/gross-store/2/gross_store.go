package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	return map[string]int{
		"quarter_of_a_dozen": 3,
		"half_of_a_dozen":    6,
		"dozen":              12,
		"small_gross":        120,
		"gross":              144,
		"great_gross":        1728,
	}
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return make(map[string]int)
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	_, ok := units[unit]
	// unit in the units
	if ok != true {
		return false
	}

	bill[item] += units[unit]
	return true
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	bVal, ok := bill[item]
	// item in the bill
	if ok != true {
		return false
	}

	uVal, ok := units[unit]
	// unit in the units
	if ok != true {
		return false
	}

	// new quantity would be less than 0
	if bVal < uVal {
		return false
	}
	// new quantity would be 0
	if bVal == uVal {
		delete(bill, item)
		return true
	}
	// new quantity would be more than 0
	bill[item] -= units[unit]
	return true
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	val, ok := bill[item]
	return val, ok
}
