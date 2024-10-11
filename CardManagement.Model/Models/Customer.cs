using System;
using System.Collections.Generic;
using System.Linq;

namespace CardManagement.Model.Models
{
    public class Customer
    {
        private static int custCount = 0;

        public string Id { get; private set; }
        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }

        public List<Account> Accounts { get; private set; } = new List<Account>();

        public Customer()
        {
            custCount++;
            Id = "Cust" + (1000 + custCount).ToString();
        }

        public Customer(string customerName, string customerAddress, string email, string phoneNumber) : this()
        {
            CustomerName = customerName;
            CustomerAddress = customerAddress;
            Email = email;
            PhoneNumber = phoneNumber;
        }

        

        public void DisplayCustomerDetails()
        {
            Console.WriteLine($"Customer Id: {Id}");
            Console.WriteLine($"Customer Name: {CustomerName}");
            Console.WriteLine($"Customer Address: {CustomerAddress}");
            Console.WriteLine($"Customer Email: {Email}");
            Console.WriteLine($"Customer Phone Number: {PhoneNumber}");

            Console.WriteLine("Accounts:");
            if (!Accounts.Any())
            {
                Console.WriteLine("  No accounts available.");
            }
            else
            {
                foreach (var account in Accounts)
                {
                    Console.WriteLine($"  Account ID: {account.Id}, Account Number: {account.AccountNumber}, Account Type: {account.AccountType}, Balance: {account.Balance}");
                }
            }
        }


        public void DisplayTransactions()
        {
            foreach (var account in Accounts)
            {
                account.DisplayTransaction(); // Call the method from Account class
            }
        }
    }
}
