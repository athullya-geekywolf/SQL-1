public class Tax
{
    public static void Main(String[] args)
    {
        Console.WriteLine("enter the amount");
        double tax;


        int amount = Convert.ToInt32(Console.ReadLine());
        if (amount < 10000)
        {
            Console.WriteLine((5.0 / 100) * amount);
        }
        else if (amount > 10000 & amount < 15000)
        {
            Console.WriteLine((7.5 / 100) * amount);
        }
        else if (amount > 15000 & amount < 20000)
        {
            Console.WriteLine((10.0 / 100) * amount);
        }
        else if (amount > 20000 & amount < 25000)
        {
            Console.WriteLine((12.5 / 100) * amount);
        }
        else
        {
            Console.WriteLine((15.0 / 100) * amount);
        }
    }
}