using System;
using System.Linq;

public static class DifferenceOfSquares
{
    public static int CalculateSquareOfSum(int max) =>
        (int)Math.Pow(max * (max + 1) / 2, 2.0);

    public static int CalculateSumOfSquares(int max) =>
        Enumerable.Range(0, max + 1).Select(x => x * x).Sum();

    public static int CalculateDifferenceOfSquares(int max) =>
        CalculateSquareOfSum(max) - CalculateSumOfSquares(max);
}
