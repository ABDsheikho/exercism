SUBLIST = 1
SUPERLIST = 2
EQUAL = 3
UNEQUAL = 4


def contains(sublist, mainlist):
    sub_len = len(sublist)
    main_len = len(mainlist)
    return any(
        mainlist[idx : idx + sub_len] == sublist
        for idx in range(main_len - sub_len + 1)
    )


def sublist(list_one, list_two):
    if list_one == list_two:
        return EQUAL
    if contains(list_one, list_two):
        return SUBLIST
    if contains(list_two, list_one):
        return SUPERLIST
    return UNEQUAL
