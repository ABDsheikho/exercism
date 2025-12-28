using System;
using System.Linq;

class BirdCount
{
    private int[] birdsPerDay;
    private static int[] birdsOfLastWeek = new int[] { 0, 2, 5, 3, 7, 8, 4 };

    public BirdCount(int[] birdsPerDay) =>
        this.birdsPerDay = birdsPerDay;

    public static int[] LastWeek() =>
        birdsOfLastWeek;

    public int Today() =>
        birdsPerDay.Last();

    public void IncrementTodaysCount() =>
        birdsPerDay[^1]++;

    public bool HasDayWithoutBirds() =>
        birdsPerDay.Contains(0);

    public int CountForFirstDays(int numberOfDays) =>
        birdsPerDay.Take(numberOfDays).Sum();

    public int BusyDays() =>
        birdsPerDay.Count(b => b >= 5);
}
