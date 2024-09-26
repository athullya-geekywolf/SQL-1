public class SumOfDigits
{
    public static void Main(string[] args)
    {
        Console.WriteLine("enter number");
        int number = Convert.ToInt32(Console.ReadLine());
        int sumofdigits = 0;
        while (number != 0)
        {
            int last_digit = number % 10;
            sumofdigits += last_digit;
            number = number / 10;

        }
        Console.WriteLine(sumofdigits);
    }
}