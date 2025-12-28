using System;

class BirdCount
{
    private int[] birdsPerDay;
    private static int[] birdsOfLastWeek = new int[] { 0, 2, 5, 3, 7, 8, 4 };

    public BirdCount(int[] birdsPerDay) =>
        this.birdsPerDay = birdsPerDay;

    public static int[] LastWeek() =>
        birdsOfLastWeek;

    public int Today() =>
        birdsPerDay[6];

    public void IncrementTodaysCount() =>
        birdsPerDay[6]++;

    public bool HasDayWithoutBirds()
    {
        foreach (int bird in birdsPerDay)
        {
            if (bird == 0) { return true; }
        }
        return false;
    }

    public int CountForFirstDays(int numberOfDays)
    {
        int sum = 0;
        foreach (int bird in birdsPerDay[0..numberOfDays])
        {
            sum += bird;
        }
        return sum;
    }

    public int BusyDays()
    {
        int count = 0;
        foreach (int bird in birdsPerDay)
        {
            if (bird >= 5) { count++; }
        }
        return count;
    }
}
