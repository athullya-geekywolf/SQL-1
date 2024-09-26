public class NumberReverse
{
    public static void Main(string[] args)
    {
        Console.WriteLine("enter number to be reversed");
        int number = Convert.ToInt32(Console.ReadLine());
        int reversed = 0;
        while (number > 0)
        {
            int remainder = number % 10;
            reversed = reversed * 10 + remainder;
            number = number / 10;
        }
        Console.WriteLine(reversed);
    }

}