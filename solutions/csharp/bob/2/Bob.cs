using System;
using System.Linq;

public static class Bob
{
    public static string Response(string statement)
    {
        statement = statement.Trim();

        switch (statement.EndsWith("?"), LettersAreUpper(statement), statement == "")
        {
            case (true, false, _):
                return "Sure.";
            case (false, true, _):
                return "Whoa, chill out!";
            case (true, true, _):
                return "Calm down, I know what I'm doing!";
            case (_, _, true):
                return "Fine. Be that way!";
            default:
                return "Whatever.";
        }
    }

    private static bool LettersAreUpper(string text) =>
        text.Where(c => Char.IsLetter(c))
            .DefaultIfEmpty('c') // to counter that .All return true for empty collection.
            .All(c => Char.IsUpper(c));
}
