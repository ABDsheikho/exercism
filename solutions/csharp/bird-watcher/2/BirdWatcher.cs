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
        birdsPerDay[6];

    public void IncrementTodaysCount() =>
        birdsPerDay[6]++;

    public bool HasDayWithoutBirds() =>
        birdsPerDay.Any(b => b == 0);

    public int CountForFirstDays(int numberOfDays) =>
        birdsPerDay[0..numberOfDays].Sum();

    public int BusyDays() =>
        birdsPerDay.Where(b => b >= 5).Count();
}
