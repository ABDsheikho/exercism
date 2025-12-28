import string


alpha = string.ascii_lowercase


def is_pangram(sentence):
    lower_sentence = sentence.lower()
    for char in alpha:
        if char not in lower_sentence:
            return False
    return True
