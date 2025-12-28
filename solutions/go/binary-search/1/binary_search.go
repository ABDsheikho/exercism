package binarysearch

func SearchInts(list []int, key int) int {
	// return SearchIntsLoop(list, key)
	return SearchIntsRec(list, key, 0)
}

func SearchIntsLoop(list []int, key int) int {
	lft := 0
	rit := len(list) - 1

	for lft <= rit {
		mid := lft + (rit-lft)/2
		if key > list[mid] {
			lft = mid + 1
		}
		if key < list[mid] {
			rit = mid - 1
		}
		if key == list[mid] {
			return mid
		}
	}
	return -1
}

func SearchIntsRec(list []int, key int, counter int) int {
	if len(list) == 0 {
		return -1
	}

	mid := len(list) / 2

	if key < list[mid] {
		return SearchIntsRec(list[:mid], key, counter)
	}
	if key > list[mid] {
		return SearchIntsRec(list[mid+1:], key, counter+mid+1)
	}

	return mid + counter
}
