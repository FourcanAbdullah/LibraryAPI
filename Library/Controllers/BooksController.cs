#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Library.Models;

namespace Library.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly LibraryAPIContext _context;

        public BooksController(LibraryAPIContext context)
        {
            _context = context;
        }

        // GET: api/Books
        [HttpGet]
        public async Task<ActionResult<Response>> GetBooks()
        {
            var books = await _context.Books.Include(e => e.Borrower).ToListAsync();
            var response = new Response();
            response.statusCode = 400;
            response.statusDescription = "Not Found - Unsuccessful";

            if (books != null)
            {
                response.statusCode = 200;
                response.statusDescription = "Status Ok, SHould recieve values";
                response.bookslist.AddRange(books);

            }
            return response;
        }

        // GET: api/Books/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Response>> GetBook(int id)
        {
            var book = await _context.Books.Include(e => e.Borrower).FirstOrDefaultAsync(b => b.BookId == id);
            var response = new Response();
            response.statusCode = 400;
            response.statusDescription = "Not Found - Unsuccessful";

            if (book != null)
            {
                response.statusCode = 200;
                response.statusDescription = "Status Ok, SHould recieve values";
                response.bookslist.Add(book);

            }

            return response;
        }

        // PUT: api/Books/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBook(int id, Book book)
        {

            if (id != book.BookId)
            {

                return BadRequest();
            }

            _context.Entry(book).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Books
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Response>> PostBook(Book book)
        {
            _context.Books.Add(book);
            await _context.SaveChangesAsync();
            var addedBook = CreatedAtAction("GetBook", new { id = book.BookId }, book);
            var response = new Response();
            response.statusCode = 400;
            response.statusDescription = "Not Found - Unsuccessful";


            if (addedBook != null)
            {
                response.statusCode = 200;
                response.statusDescription = "Status Ok, SHould recieve values";
                response.bookslist.Add(book);

            }



            return response;
        }

        // DELETE: api/Books/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBook(int id)
        {
            //var book = await _context.Books.Include(c => c.Borrower).FirstOrDefaultAsync(c => c.BookId == id);
            var book = await _context.Books.FindAsync(id);
            var response = new Response();
            response.statusCode = 400;
            response.statusDescription = "Not Found - Unsuccessful";
            if (book != null)
            {
                response.statusCode = 200;
                response.statusDescription = "Status Ok, SHould recieve values";
                response.bookslist.Add(book);
            }

            _context.Books.Remove(book);
            /*var borrower = await _context.Borrowers.FirstOrDefaultAsync(e => e.BorrowerId == book.Borrower.BorrowerId);
            _context.Borrowers.Remove(borrower);*/
            await _context.SaveChangesAsync();

            return Ok(response);
        }

        private bool BookExists(int id)
        {
            return _context.Books.Any(e => e.BookId == id);
        }
    }
}
