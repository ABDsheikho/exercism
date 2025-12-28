class Lasagna
{
    public int ExpectedMinutesInOven() => 40;

    public int RemainingMinutesInOven(int minutes)
    {
        return ExpectedMinutesInOven() - minutes;
    }

    public int PreparationTimeInMinutes(int layers) => layers * 2;

    public int ElapsedTimeInMinutes(int numberOfLayers, int minutes)
    {
        return PreparationTimeInMinutes(numberOfLayers) + minutes;
    }

}
