def response(hey_bob: str) -> str:
    hey_bob = hey_bob.strip()
    match (hey_bob.endswith("?"), hey_bob.isupper(), hey_bob == ""):
        case (True, False, _):
            return "Sure."
        case (False, True, _):
            return "Whoa, chill out!"
        case (True, True, _):
            return "Calm down, I know what I'm doing!"
        case (_, _, True):
            return "Fine. Be that way!"
        case _:
            return "Whatever."
