using System;
namespace Library.Models
{
    public class Borrower
    {
        public int BorrowerId { get; set; }
        public string? Borrower_FirstName { get; set; }
        public string? Borrower_LastName { get; set; }
        public string? Borrower_Email { get; set; }
        public bool CurrentlyBorrowing { get; set; }
    }
}
