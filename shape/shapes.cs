using System;

namespace Shapes
{
    public class Circle : IShape
    {
        public double Radius { get; set; }
        public Circle(double radius)
        {
            Radius = radius;
        }

        public double CalculateArea()
        {
            return 3.14 * Radius * Radius;
        }

        public double CalculatePerimeter()
        {
            return 2 * 3.14 * Radius;
        }
    }


    public class Rectangle : IShape
    {
        public double Length { get; set; }
        public double Breadth { get; set; }
        public Rectangle(double length,double breadth)
        {
            Length = length;
            Breadth = breadth;
        }

        public double CalculateArea()
        {
            return Length * Breadth;
        }

        public double CalculatePerimeter()
        {
            return 2 * (Length+Breadth);
        }
    }


    public class Triangle : IShape
    {
        public double Base { get; set; }
        public double Height { get; set; }
        public Triangle(double baselen,double height)
        {
            Base = baselen;
            Height = height;
        }

        public double CalculateArea()
        {
            return 0.5*Base*Height;
        }

        public double CalculatePerimeter()
        {
            double hyp = Math.Sqrt(Base * Base + Height * Height);
            return Base+Height+hyp;
        }
    }
    public class Program
    {
        static void Main(string[] args)
        {

            IShape circle = new Circle(5);
            Console.WriteLine($"Circle Area: {circle.CalculateArea()}");
            Console.WriteLine($"Circle Perimeter: {circle.CalculatePerimeter()}");

            IShape rectangle = new Rectangle(4, 6);
            Console.WriteLine($"Rectangle Area: {rectangle.CalculateArea()}");
            Console.WriteLine($"Rectangle Perimeter: {rectangle.CalculatePerimeter()}");

            IShape triangle = new Triangle(5, 4);
            Console.WriteLine($"Triangle Area: {triangle.CalculateArea()}");
            Console.WriteLine($"Triangle Perimeter: {triangle.CalculatePerimeter()}");

        }
    }
}
