using System;


namespace Animals
{
    public class Cat : Animal
    {
        public override string Name { get; set; } = "Catty";
        public override string Sound { get; set; } = "Meow";
        public override void MakeSound()
        {
            Console.WriteLine($"Sound of {Name} is {Sound}");
        }

    }

    public class Dog : Animal
    {
        public override string Name { get; set; } = "Doggy";
        public override string Sound { get; set; } = "Bow";
        public override void MakeSound()
        {
            Console.WriteLine($"Sound of {Name} is {Sound}");
        }

    }

    public class Bird : Animal
    {
        public override string Name { get; set; } = "Birddy";
        public override string Sound { get; set; } = "Chirp";
        public override void MakeSound()
        {
            Console.WriteLine($"Sound of {Name} is {Sound}");
        }

    }
    public class Program
    {
        static void Main(string[] args)
        {
            Animal cat = new Cat();
            Animal dog = new Dog();
            Animal bird= new Bird();

            cat.MakeSound();
            dog.MakeSound();
            bird.MakeSound();
        }
    }
}
