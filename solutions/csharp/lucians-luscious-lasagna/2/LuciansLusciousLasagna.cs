class Lasagna
{
    private const int MINUTES_TO_COOK = 40;
    private const int MINUTES_TO_PREP = 2;

    public int ExpectedMinutesInOven() =>
        MINUTES_TO_COOK;

    public int RemainingMinutesInOven(int minutes) =>
        ExpectedMinutesInOven() - minutes;

    public int PreparationTimeInMinutes(int layers) =>
        layers * MINUTES_TO_PREP;

    public int ElapsedTimeInMinutes(int numberOfLayers, int minutes) =>
        PreparationTimeInMinutes(numberOfLayers) + minutes;

}
