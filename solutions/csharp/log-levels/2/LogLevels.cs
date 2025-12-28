using System;

static class LogLine
{
    public static string Message(string logLine) =>
        logLine.Split(':')[1].Trim();

    public static string LogLevel(string logLine)
    {
        var firstLetterIndex = logLine.IndexOf('[') + 1;
        var rightBracketIndex = logLine.IndexOf(']');
        return logLine[firstLetterIndex..rightBracketIndex].ToLower();
    }

    public static string Reformat(string logLine) =>
        $"{Message(logLine)} ({LogLevel(logLine)})";
}
