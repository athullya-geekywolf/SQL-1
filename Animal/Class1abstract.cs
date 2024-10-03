
namespace Animals
{
    public abstract class Animal
    {
        public abstract string Name { get; set; }
        public abstract string Sound { get; set; }

        public abstract void MakeSound();
    }
}
