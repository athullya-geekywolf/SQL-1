namespace MathsOperation
{
    public class ArithmeticOperation
    {
        public double Add(double num1, double num2)
        {
            return (num1 + num2);
        }
        public double Sub(double num1, double num2)
        {
            return (num1 - num2);
        }
    }

    public class RelationalOperation
    {
        public bool GreatherThan(double num1, double num2)
        {
            return num1 > num2;
        }
        public bool Equal(double num1, double num2)
        {
            return (num1 == num2);
        }
    }
}
