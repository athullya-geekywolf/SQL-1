using System;
using System.ComponentModel;


namespace Animal
{
    public class Animals
    {
        public string Name { get; set; }
        public virtual void Sound()
        {
            Console.WriteLine("Base class Sound");
        }
    }

    public class Dog:Animals
    {
        public override void Sound()
        {
            Console.WriteLine($"{Name} says:Dog class sound");
        }
    }

    public class Cat : Animals
    {
        public override void Sound()
        {
            Console.WriteLine($"{Name} says:Cat class sound");
        }
    }

    public class Birds : Animals
    {
        public override void Sound()
        {
            Console.WriteLine($"{Name} says:Birds class sound");
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Dog dog = new Dog { Name="doggy"};
            Cat cat = new Cat { Name="Catty"};
            Birds birds = new Birds { Name="birdy"};
            
            dog.Sound();
            cat.Sound();
            birds.Sound();

        }
    }
}
