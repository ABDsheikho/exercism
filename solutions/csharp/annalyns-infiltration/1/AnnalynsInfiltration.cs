using System;


static class QuestLogic
{
    public static bool CanFastAttack(bool knightIsAwake) => 
        !knightIsAwake;

    public static bool CanSpy(bool knightIsAwake, bool archerIsAwake, bool prisonerIsAwake) =>
        (knightIsAwake || archerIsAwake || prisonerIsAwake);

    public static bool CanSignalPrisoner(bool archerIsAwake, bool prisonerIsAwake) => 
        (!archerIsAwake && prisonerIsAwake);

    public static bool CanFreePrisoner
        (bool knightIsAwake, bool archerIsAwake, bool prisonerIsAwake, bool petDogIsPresent)
    {
        switch (knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent)
        {
            case (_, false, _, true):
                return true;
            case (false, false, true, false):
                return true;
            default:
                return false;
        }
    }
}
