using System;

public static class PhoneNumber
{
    public static (bool IsNewYork, bool IsFake, string LocalNumber) Analyze(string phoneNumber)
    {
        var digits = phoneNumber.Split('-');
        return (digits[0] == "212", digits[1] == "555", digits[2]);
    }

    public static bool IsFake((bool IsNewYork, bool IsFake, string LocalNumber) phoneNumberInfo) =>
        phoneNumberInfo.IsFake;
}
