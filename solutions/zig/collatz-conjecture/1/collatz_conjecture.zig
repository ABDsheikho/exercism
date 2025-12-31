// Please implement the `ComputationError.IllegalArgument` error.

pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) anyerror!usize {
    if (number < 1) {
        return ComputationError.IllegalArgument;
    }

    var step: usize = 0;
    var res = number;

    while (res > 1) {
        step = step + 1;
        if (res % 2 == 0) {
            res = res / 2;
        } else {
            res = res * 3 + 1;
        }
    }

    return step;
}
