using System;

namespace Shape
{
    public class Shape
    {
       
        public virtual void CalculateArea()
            {
            Console.WriteLine("Base Class");
            }
    }

    public class Circle:Shape
    {
        public double radius { get; set; }

        public Circle(double radius)
        {
            this.radius = radius;
        }

        public override void CalculateArea()
        {
            double area = 3.14*radius*radius;
            Console.WriteLine("Circle Class");
            Console.WriteLine($"Circle:{area}");

        }
    }

    public class Rectangle:Shape
    {
        public Rectangle(double length, double breadth)
        {
            this.length = length;
            this.breadth = breadth;
        }

        public double length { get; set; }
        public double breadth { get; set; }
        public override void CalculateArea()
        {
            double area = length * breadth;
            Console.WriteLine("Rectangle Class");
            Console.WriteLine($"Rectangle:{area}");
        }
    }

    public class Triangle:Shape
    {
        public Triangle(double baselength, double height)
        {
            this.baselength = baselength;
            this.height = height;
        }

        public double baselength { get; set; }
        public double height { get; set; }
        public override void CalculateArea()
        {
            double area = baselength * height;
            Console.WriteLine("Triangle Class");
            Console.WriteLine($"Triangle:{area}");
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Circle circle = new Circle(2);
            Rectangle rect = new Rectangle(3,4);
            Triangle triangle = new Triangle(5,4.5);

            circle.CalculateArea();
            rect.CalculateArea();
            triangle.CalculateArea();

        }
    }
}
