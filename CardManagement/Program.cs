using CardManagement.Model;
using CardManagement.Model.Models;
using Microsoft.EntityFrameworkCore;

namespace CardManagement
{
    public class Program
    {
        static void Main(string[] args)
        {
            using (var context = new CardManagementContext())
            {
                // Ensure the database is created
                context.Database.EnsureCreated();

                // Check if customers already exist to avoid duplication
                if (!context.Customers.Any())
                {
                    // Create customers and their accounts
                    Customer customer1 = new Customer("Ram", "St.101, Mumbai", "ram@gmail.com", "9207991234");
                    Account account1 = new Account("111122", AccountType.Debit, 0.00);
                    customer1.Accounts.Add(account1);
                    Account account2 = new Account("111123", AccountType.Credit, 0.00);
                    customer1.Accounts.Add(account2);

                    Customer customer2 = new Customer("Sam", "St.102, Bangalore", "sam01@gmail.com", "7207991234");
                    Account account3 = new Account("222111", AccountType.Credit, 0.00);
                    customer2.Accounts.Add(account3);



                    Transaction transaction1 = new Transaction(DateTime.Parse("2023-10-02"), TransactionType.Deposit, 1000.00, "Deposited", account1);
                    account1.AddTransaction(transaction1);

                    Transaction transaction2 = new Transaction(DateTime.Parse("2023-11-03"), TransactionType.Withdrawal, 500.00, "ATM Withdrawal", account2);
                    account2.AddTransaction(transaction2);

                    Transaction transaction3 = new Transaction(DateTime.Parse("2024-06-03"), TransactionType.Withdrawal, 500.00, "ATM Withdrawal", account3);
                    account3.AddTransaction(transaction3);

                    context.Transactions.Add(transaction1);
                    context.Transactions.Add(transaction2);
                    context.Transactions.Add(transaction3);

                    context.Accounts.Add(account1);
                    context.Accounts.Add(account2);
                    context.Accounts.Add(account3);


                    // Add customers to the context


                    // Save changes to the database
                    context.Customers.Add(customer1);
                    context.Customers.Add(customer2);

                    context.SaveChanges();
                }

                // Display added customers and their transactions
                foreach (var customer in context.Customers.Include(c => c.Accounts).ThenInclude(a => a.Transactions))
                {
                    customer.DisplayCustomerDetails();
                    customer.DisplayTransactions(); // Display transactions for each customer
                    Console.WriteLine();
                }

                DisplayCustomerDetails(context, "Cust1001");

                Console.WriteLine();    

                // Retrieve and display account details for Id = 5
                DisplayAccountDetails(context, "Acc1002");
            }
        }

        static void DisplayCustomerDetails(CardManagementContext context, string customerId)
        {
            var customer = context.Customers
                .Include(c => c.Accounts)
                .ThenInclude(a => a.Transactions)
                .FirstOrDefault(c => c.Id == customerId);

            if (customer != null)
            {
                Console.WriteLine("Customer Details:");
                Console.WriteLine($"ID: {customer.Id}");
                Console.WriteLine($"Name: {customer.CustomerName}");
                Console.WriteLine($"Address: {customer.CustomerAddress}");
                Console.WriteLine($"Email: {customer.Email}");
                Console.WriteLine($"Phone: {customer.PhoneNumber}");

                foreach (var account in customer.Accounts)
                {
                    Console.WriteLine($"Account Number: {account.AccountNumber} - Type: {account.AccountType}");
                    foreach (var transaction in account.Transactions)
                    {
                        Console.WriteLine($"  Transaction: {transaction.TransactionType} - Amount: {transaction.Amount} - Date: {transaction.TransactionDate}");
                    }
                }
            }
            else
            {
                Console.WriteLine("Customer not found.");
            }
        }


        static void DisplayAccountDetails(CardManagementContext context, string accountId)
        {
            var account = context.Accounts
                .Include(a => a.Transactions)
                .FirstOrDefault(a => a.Id == accountId);

            if (account != null)
            {
                Console.WriteLine("Account Details:");
                Console.WriteLine($"Account ID: {account.Id}");
                Console.WriteLine($"Account Number: {account.AccountNumber}");
                Console.WriteLine($"Type: {account.AccountType}");
                Console.WriteLine($"Balance: {account.Balance}");

                foreach (var transaction in account.Transactions)
                {
                    Console.WriteLine($"  Transaction: {transaction.TransactionType} - Amount: {transaction.Amount} - Date: {transaction.TransactionDate}");
                }
            }
            else
            {
                Console.WriteLine("Account not found.");
            }
        }
    
    }
}
