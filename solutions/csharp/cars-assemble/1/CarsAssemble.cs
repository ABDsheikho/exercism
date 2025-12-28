using System;

static class AssemblyLine
{
    private const int CARS_PER_HOUR = 221;

    public static double SuccessRate(int speed)
    {
        switch (speed)
        {
            case <= 4 when speed > 0:
                return 1;
            case <= 8 when speed > 4:
                return 0.9;
            case 9:
                return 0.8;
            case 10:
                return 0.77;
            default:
                return 0;
        }
    }

    public static double ProductionRatePerHour(int speed) =>
        SuccessRate(speed) * CARS_PER_HOUR * speed;

    public static int WorkingItemsPerMinute(int speed) =>
        (int)(ProductionRatePerHour(speed) / 60);
}
