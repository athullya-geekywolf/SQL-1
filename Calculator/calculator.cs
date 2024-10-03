using System;
using MathsOperation;

namespace Calculator
{
    public class calculator
    {
        static void Main(string[] args)
        {
            ArithmeticOperation arith = new ArithmeticOperation();
            RelationalOperation rel = new RelationalOperation();

            double num1 = 23.1;
            double num2 = 11.2;

            Console.WriteLine($"Sum:{arith.Add(num1, num2)}");
            Console.WriteLine($"Difference:{arith.Sub(num1, num2)}");

            Console.WriteLine($"IsEqual:{rel.Equal(num1,num2)}");
            Console.WriteLine($"IsGreater:{rel.GreatherThan(num1,num2)}");

            Console.ReadLine();
        }
    }
}
