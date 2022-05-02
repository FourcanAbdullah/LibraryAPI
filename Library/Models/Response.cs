using System;
namespace Library.Models
{
    public class Response
    {

        public int statusCode { get; set; }

        public string? statusDescription { get; set; }

        public List<Book> bookslist { get; set; } = new();

        public List<Borrower> borrowerslist { get; set; } = new();


    }
}
