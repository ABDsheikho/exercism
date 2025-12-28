def rebase(input_base, digits, output_base):
    if input_base < 2:
        raise ValueError("input base must be >= 2")

    if output_base < 2:
        raise ValueError("output base must be >= 2")

    if any(x for x in digits if x < 0 or x >= input_base):
        raise ValueError("all digits must satisfy 0 <= d < input base")

    if not any(x != 0 for x in digits):
        return [0]

    number = _to_base_ten(input_base, digits)
    return _to_base(number, output_base)


def _to_base_ten(input_base, digits):
    expo = [digit * input_base**idx for idx, digit in enumerate(reversed(digits))]
    return sum(expo)


def _to_base(number, output_base):
    digits = []
    while number > 0:
        digits.insert(0, number % output_base)
        number = number // output_base
    return digits
