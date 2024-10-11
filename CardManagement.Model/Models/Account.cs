using System;
using System.Collections.Generic;
using System.Linq;

namespace CardManagement.Model.Models
{
    public enum AccountType
    {
        Debit,
        Credit
    }

    public class Account
    {
        private static int acccount = 0;

        public string Id { get; private set; }
        public string AccountNumber { get; set; }
        public AccountType AccountType { get; set; }
        public double Balance { get; set; }
        public List<Transaction> Transactions { get; private set; } = new List<Transaction>();

        public Account()
        {
            acccount++;
            Id = "Acc" + (1000 + acccount).ToString();
        }

        public Account(string accountNumber, AccountType accountType, double balance) : this()
        {
            AccountNumber = accountNumber;
            AccountType = accountType;
            Balance = balance;
        }

        public void AddTransaction(Transaction transaction)
        {
            Transactions.Add(transaction);
            Console.WriteLine("added trans");

            if (transaction.TransactionType == TransactionType.Deposit)
            {
                Console.WriteLine($"For transaction in account: {Id}");
                Balance += transaction.Amount;
                Console.WriteLine($"Balance is: {Balance}");
            }
            else
            {
                if (transaction.TransactionType == TransactionType.Withdrawal || transaction.TransactionType == TransactionType.Transfer)
                {
                    Console.WriteLine($"For transaction in account: {Id}");
                    Balance -= transaction.Amount;
                    if (Balance < 0)
                    {
                        Balance += transaction.Amount;
                        Console.WriteLine("Insufficient Balance");
                    }
                    else
                        Console.WriteLine($"Balance is: {Balance}");
                }
            }


            
        }

        


        public void DisplayTransaction()
        {
            Console.WriteLine($"Transactions for Account Number: {AccountNumber}");
            if (!Transactions.Any())
            {
                Console.WriteLine("  No transactions available.");
            }
            else
            {
                foreach (var transaction in Transactions)
                {
                    Console.WriteLine($"  ID: {transaction.Id}, Date: {transaction.TransactionDate}, Type: {transaction.TransactionType}, Amount: {transaction.Amount}, Description: {transaction.Description}");
                }
            }
        }
    }
}
