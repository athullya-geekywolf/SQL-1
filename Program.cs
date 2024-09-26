public class CheckPrime
{
    public static void Main(string[] args)
    {
        int number;
        int flag = 0;
        Console.WriteLine("enter number");
        number = Convert.ToInt32(Console.ReadLine());
        for (int i = 2; i <= number/2; i++)
        {
            if(number % i == 0)
            {
                Console.WriteLine("Not prime");
                flag = 1;
                break;
            }

        }
        if (flag == 0)
        {
            Console.WriteLine("Number is prime");
        }
    }
}
