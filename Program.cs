public class Pattern
{
    public static void Main(string[] args)
    {
        Console.WriteLine("enter number of lines required(n)");
        int n = Convert.ToInt32(Console.ReadLine());
        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j <=i; j++)
            {
                Console.Write("*");
            }
            Console.WriteLine("\n");
        }
    }
}