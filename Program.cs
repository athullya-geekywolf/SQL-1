public class Palindrome
{
    public static void Main(string[] args)
    {
        Console.WriteLine("enter the string");
        string str=Console.ReadLine();
        string reversed = "";
        for(int i=str.Length-1;i>=0; i--)
        {
            reversed += str[i];
        }
        if(reversed==str)
        {
            Console.WriteLine("Palindrome");
        }
        

    }
}