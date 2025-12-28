def square_root(number):
    # applying Heron's method
    x0 = number
    x1 = number / 2
    while x1 != x0:
        x0 = x1
        x1 = (x0 + (number / x0)) / 2
    return x1
