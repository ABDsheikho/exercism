using System;
using System.Collections.Generic;
using System.Linq;

public static class SumOfMultiples
{
    // Calculate the number of multiples of 'digit' that are less than 'max'
    private static int CountMultiples(int digit, int max) =>
        digit == 0 ? 1 : (max - 1) / digit; // no need for Math.Floor() method

    // Generate an array of multiples of 'digit' that are less than 'max'
    private static IEnumerable<int> GenerateArrayOfMultiples(int digit, int max) =>
        Enumerable.Range(1, CountMultiples(digit, max)).Select(val => val * digit);

    // Calculate the sum of distinct multiples from the given collection up to 'max'
    public static int Sum(IEnumerable<int> multiples, int max) =>
        multiples.SelectMany(mul => GenerateArrayOfMultiples(mul, max))
                 .Distinct()
                 .Sum();
}
