using System;
using System.Collections.Generic;
using System.Linq;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max) =>
        Enumerable.Range(0, max)
                  .Where(val => multiples.Any(mul => mul != 0 && val % mul == 0))
                  .Sum();
}
