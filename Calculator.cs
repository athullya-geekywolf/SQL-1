using System;

namespace Calculator
{
    public class Calc
    {
        public double add(double num1, double num2)
        {
            return num1 + num2;
        }

        public double diff(double num1, double num2)
        {
            return num1 - num2;
        }

        public double mult(double num1, double num2)
        {
            return num1 * num2;
        }

        public double div(double num1, double num2)
        {
            if(num2==0)
            {
                throw new DivideByZeroException("error:Impossible division");
            }
            return num1 / num2;
        }
    }
        public class Program
    {
        static void Main(string[] args)
        {
            Calc calc = new Calc();
            int num1=Convert.ToInt32(Console.ReadLine());
            int num2=Convert.ToInt32(Console.ReadLine());

            Console.WriteLine($"Addition:{calc.add(num1, num2)}");
            Console.WriteLine($"Difference:{calc.diff(num1, num2)}");
            Console.WriteLine($"Multiplication:{calc.mult(num1, num2)}");
            try
            {
                Console.WriteLine($"Division:{calc.div(num1, num2)}");
            }
            catch (DivideByZeroException ex)
            {
                {
                    Console.WriteLine($"Message:{ex}");
                }



            }

        }
    }
}
