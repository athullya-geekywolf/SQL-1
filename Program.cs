public class SumOfSquares
{
    public static void Main(string[] args)
    {
        Console.WriteLine("enter number");
        int number=Convert.ToInt32(Console.ReadLine());
        int sum_of_squares = 0;
        while (number > 0)
        {
            int last = number % 10;
            sum_of_squares=sum_of_squares+last*last;
            number = number / 10;
        }
        Console.WriteLine(sum_of_squares);
    }
}