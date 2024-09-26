public class AllPrime
{
    public static void Main(string[] args)
    {
        int number=100;
        
        
        Console.WriteLine("Prime numbers under 100");
        for(int i=2;i<number; i++) 
        {
            int flag = 0;
            for (int j = 2; j <= i / 2; j++)
            {
                if (i % j == 0)
                {
                    flag = 1;
                    break;
                   
                    
                }

            }
            if (flag == 0)
            {
                Console.WriteLine(i);
            }

            
        }
        
    }
}
