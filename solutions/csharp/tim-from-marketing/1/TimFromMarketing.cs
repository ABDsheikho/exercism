static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        var strId = id == null ? "" : $"[{id}] - ";
        var dep = department ?? "owner";
        return $"{strId}{name} - {dep.ToUpper()}";
    }
}
