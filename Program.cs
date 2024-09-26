public class Fibonacci
{
    public static void Main(string[] args)
    {
        Console.WriteLine("Enter the number of terms(n) required");
        int n=Convert.ToInt32(Console.ReadLine());
        int firstnum = 0;
        int secondnum=1;



        for (int i = 1; i <= n; i++)
        {
            if (i == 1)
            {
                Console.WriteLine(firstnum);
            }
            else if (i == 2)
            {
                Console.WriteLine(secondnum);
            }
            else
            {
                int next = firstnum + secondnum;
                Console.WriteLine(next);
                firstnum = secondnum;
                secondnum = next;
            }
        }
        

    }
}