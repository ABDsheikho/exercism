using System;

static class SavingsAccount
{
    public static float InterestRate(decimal balance) =>
        balance < 0 ? 3.213f :
        balance < 1000 ? 0.5f :
        balance < 5000 ? 1.621f :
        2.475f;

    public static decimal Interest(decimal balance) =>
        (decimal)InterestRate(balance) * balance / 100;

    public static decimal AnnualBalanceUpdate(decimal balance) =>
        balance + Interest(balance);

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        int period = 0;
        while (balance < targetBalance)
        {
            balance = AnnualBalanceUpdate(balance);
            period++;
        }
        return period;
    }
}
