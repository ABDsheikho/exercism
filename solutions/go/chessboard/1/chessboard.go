package chessboard

// Declare a type named File which stores if a square is occupied by a piece - this will be a slice of bools
type File []bool

// Declare a type named Chessboard which contains a map of eight Files, accessed with keys from "A" to "H"
type Chessboard map[string]File

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) int {
	counter := 0
	for _, val := range cb[file] {
		if val {
			counter++
		}
	}
    return counter
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) int {
    if rank > 8 || rank < 1 { // rank is not within chessboard coord system
        return 0
    }
	counter := 0
	for _, val := range cb {
		if val[rank-1] { // rank start from 1 not 0
			counter++
		}
	}
	return counter
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) int {
	return 8*8 // this will break if the board is not a chessboard
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) int {
	total := 0
	files := [8]string{"A", "B", "C", "D", "E", "F", "G", "H"} // hard coded
	for _, file := range files {
		total += CountInFile(cb, file)
	}
	return total
}
