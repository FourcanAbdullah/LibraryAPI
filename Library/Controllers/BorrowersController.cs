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
    public class BorrowersController : ControllerBase
    {
        private readonly LibraryAPIContext _context;

        public BorrowersController(LibraryAPIContext context)
        {
            _context = context;
        }

        // GET: api/Borrowers
        [HttpGet]
        public async Task<ActionResult<Response>> GetBorrowers()
        {
            var response = new Response();
            var borrowers = await _context.Borrowers.ToListAsync();
            response.statusCode = 400;
            response.statusDescription = "Not Found - Unsuccessful";

            if (borrowers != null)
            {
                response.statusCode = 200;
                response.statusDescription = "Status Ok, SHould recieve values";
                response.borrowerslist.AddRange(borrowers);

            }
            return response;
        }

    }
}
