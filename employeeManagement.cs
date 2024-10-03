using System;

namespace EmployeeManagement
{

    public class Employee
    {


        public int Id { get; private set; }
        public string Name { get; set; }
        public double Salary { get; set; }
        private string employmentType;
        public string EmploymentType
        {
            get
            {
                return employmentType;
            }
            set
            {
                if (value == "Permanent" || value == "Contract")
                {
                    employmentType = value;
                }
                else
                {
                    throw new ArgumentException("EmploymentType must be either 'Permanent' or 'Contract'.");
                }
            }
        }

        public Employee(int id, string name, double salary, string employeeType)
        {
            Id = id;
            Name = name;
            Salary = salary;
            EmploymentType = employeeType;
        }

        public void display()
        {
            Console.WriteLine($"Employee Id:{Id} , Employee Name:{Name}, Employee Salary:{Salary}");
        }
    }
    public class Program
    {
        static void Main(string[] args)
        {
                Employee emp1 = new Employee(1, "John Doe", 15000,"Permanent");
                Employee emp2 = new Employee(2, "Liam Smith", 20000, "Permanent");
                Employee emp3 = new Employee(3, "Mary James", 15000, "Permanent");

                emp1.display();
                emp2.display();
                emp3.display();
               
            }
    }
}
