public class Charactermatch
{
    public static void Main(string[] args)
    {
        L1: Console.WriteLine("enter the character");
        string character = Console.ReadLine();
        switch(character)
        {
            case "c":
                Console.WriteLine("Cricket");
                break;
            case "f":
                Console.WriteLine("Football");
                break;
            case "h":
                Console.WriteLine("hockey");
                break;
            case "t":
                Console.WriteLine("Tennis");
                break;
            case "b":
                Console.WriteLine("basketball");
                break;
            default:
                Console.WriteLine("Invalid input, try again");
                goto L1;
                
        }
    }
}