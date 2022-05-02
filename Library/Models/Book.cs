using System;
namespace Library.Models
{
    public class Book
    {
        public int BookId { get; set; }
        public string? BookTitle { get; set; }
        public string? BookAuthor { get; set; }
        public string? BookSummary { get; set; }
        public bool IsBorrowed { get; set; }

        public virtual Borrower? Borrower { get; set; }
    }
}
