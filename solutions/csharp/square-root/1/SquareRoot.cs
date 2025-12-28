using System;

public static class SquareRoot
{
    public static int Root(int number)
    {
        int res = 1;
        while (res * res < number)
        {
            res++;
        }
        return res;
    }
}
