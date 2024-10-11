using System;

namespace CardManagement.Model.Models
{
    public enum TransactionType
    {
        Deposit,
        Withdrawal,
        Transfer
    }

    public class Transaction
    {
        private static int transCount = 0;

        public string Id { get; private set; }
        public DateTime TransactionDate { get; set; }
        public TransactionType TransactionType { get; set; }
        public double Amount { get; set; }
        public string Description { get; set; }
        public Account Account { get; set; }

        public Transaction()
        {
            transCount++;
            Id = "Txn" + (1000 + transCount).ToString();
        }

        public Transaction(DateTime transactionDate, TransactionType transactionType, double amount, string description,Account account) : this()
        {
            TransactionDate = transactionDate;
            TransactionType = transactionType;
            Amount = amount;
            Description = description;
            Account = account;

            
        }

       

    }
}
