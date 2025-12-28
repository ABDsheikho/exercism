class RemoteControlCar
{
    public readonly int Speed;
    public readonly int BatteryDrains;
    public int CrossedDistance { get; private set; } = 0;
    public int BatteryPer { get; private set; } = 100;

    public RemoteControlCar(int speed, int batteryDrains)
    {
        this.Speed = speed;
        this.BatteryDrains = batteryDrains;
    }

    public void Drive()
    {
        if (!this.BatteryDrained())
        {
            this.CrossedDistance += this.Speed;
            this.BatteryPer -= this.BatteryDrains;
        }
    }

    public bool BatteryDrained() => this.BatteryPer < this.BatteryDrains;

    public int DistanceDriven() => this.CrossedDistance;

    public static RemoteControlCar Nitro() => new RemoteControlCar(50, 4);
}

class RaceTrack
{
    public readonly int Distance;

    public RaceTrack(int distance)
    {
        this.Distance = distance;
    }

    public bool TryFinishTrack(RemoteControlCar car) =>
        this.Distance * car.BatteryDrains <= car.BatteryPer * car.Speed;
}
