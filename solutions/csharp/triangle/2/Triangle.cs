using System;

public static class Triangle
{
   private static bool IsTriangle(double side1, double side2, double side3) =>
        side1 + side2 > side3 && side2 + side3 > side1 && side3 + side1 > side2;
 
    public static bool IsScalene(double side1, double side2, double side3) =>
        IsTriangle(side1, side2, side3) && LogicalTest(side1, side2, side3).isScalene;

    public static bool IsIsosceles(double side1, double side2, double side3) =>
        IsTriangle(side1, side2, side3) && LogicalTest(side1, side2, side3).isIsosceles;

    public static bool IsEquilateral(double side1, double side2, double side3) =>
        IsTriangle(side1, side2, side3) && LogicalTest(side1, side2, side3).isEquilateral;

    private static (bool isScalene, bool isIsosceles, bool isEquilateral) LogicalTest(double side1, double side2, double side3)
    {
        var res = (isScalene: false, isIsosceles: false, isEquilateral: false);
        switch ((side1 == side2, side2 == side3, side3 == side1))
        {
            case (true, true, true):
                res.isEquilateral = true;
                res.isIsosceles = true;
                return res;
            case (false, false, false):
                res.isScalene = true;
                return res;
            default:
                res.isIsosceles = true;
                return res;
        }
    }
}
