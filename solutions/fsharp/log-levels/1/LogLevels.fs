module LogLevels

open System.Text.RegularExpressions

let pattern = 
    Regex("\[(\w+)\]:\s+(.*)")

let message (logLine: string): string = 
    pattern.Match(logLine).Groups[2].Value.Trim()

let logLevel(logLine: string): string = 
    pattern.Match(logLine).Groups[1].Value.ToLower()

let reformat(logLine: string): string =
    let lvl = logLevel logLine
    let msg = message logLine
    sprintf $"{msg} ({lvl})"