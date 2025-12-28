"""
This exercise stub and the test suite contain several enumerated constants.

Enumerated constants can be done with a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

# Possible sublist categories.
# Change the values as you see fit.
SUBLIST = 1
SUPERLIST = 2
EQUAL = 3
UNEQUAL = 4


def contains(sublist, mainlist):
    sublist_length = len(sublist)
    mainlist_length = len(mainlist)
    for idx in range(mainlist_length - sublist_length + 1):
        if mainlist[idx : idx + sublist_length] == sublist:
            return True
    return False


def sublist(list_one, list_two):
    if list_one == list_two:
        return EQUAL
    if len(list_one) < len(list_two) and contains(list_one, list_two):
        return SUBLIST
    if len(list_one) > len(list_two) and contains(list_two, list_one):
        return SUPERLIST
    return UNEQUAL
