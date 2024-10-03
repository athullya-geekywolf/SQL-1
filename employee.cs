using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Employee
{

    public class Employee
    {
        private static int empcount = 0;
        public string Id { get; private set; }
        public string Name { get; set; }
        public double Salary { get; set; }
        public string EmployeeType { get; set; }

        public Employee(int id) 
        {
            empcount++;
            Id="Emp"+(1000+id).ToString();
        }

        public Employee(int id,string name):this(id)
        {
            Name=name;
        }

        public Employee(int id,string name ,double salary):this(id,name)
        {
            Salary=salary;
        }

        public void DisplayDetails()
        {
            Console.WriteLine($"ID: {Id}");
            Console.WriteLine($"Name: {Name}");
            Console.WriteLine($"Salary: {Salary}");
           
        }

        public void GetNumberOfEmployees()
        {
            Console.WriteLine($"number of employees:{empcount}");
        }


    }
    public class Program
    {
        static void Main(string[] args)
        {
            
            Employee emp1 = new Employee(1, "John Doe", 15000);
            Employee emp2 = new Employee(2, "Liam Smith", 20000);
            Employee emp3 = new Employee(3, "Mary James", 15000);

            Console.WriteLine("employee details");
            emp1.DisplayDetails();
            emp2.DisplayDetails();
            emp3.DisplayDetails();
            Console.WriteLine();
            emp1.GetNumberOfEmployees();
        }
    }
}
