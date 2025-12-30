pub fn isLeapYear(year: u32) bool {
    if (@mod(year, 400) == 0 or ((@mod(year, 4) == 0) and (@mod(year, 100) != 0))) {
        return true;
    }
    return false;
}
