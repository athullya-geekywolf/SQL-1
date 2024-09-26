public class Program3
{
	public static void Main(String[] args)
	{
		int[] num = new int[3];
		Console.WriteLine("Enter three numbers");
		for (int i = 0; i < 3; i++)
		{
			num[i]=Convert.ToInt32(Console.ReadLine());
			
		}
		int maxi = num[0];
        for (int i = 1; i < 3; i++)
        {
			if (num[i]>maxi)
			{
				maxi=num[i];
			}

        }
		Console.WriteLine("largest:"+maxi);

    }
}