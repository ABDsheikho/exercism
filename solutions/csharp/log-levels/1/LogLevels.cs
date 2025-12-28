using System;

static class LogLine
{
    public static string Message(string logLine) =>
        logLine.Split(':')[1].Trim();

    public static string LogLevel(string logLine)
    {
        var firstLetterIndex = logLine.IndexOf('[') + 1;
        var rightBracketIndex = logLine.IndexOf(']');
        var length = rightBracketIndex - firstLetterIndex;
        return logLine.Substring(firstLetterIndex, length).ToLower();
    }

    public static string Reformat(string logLine)
    {
        var level = LogLine.LogLevel(logLine);
        var message = LogLine.Message(logLine);
        return $"{message} ({level})";
    }
}
