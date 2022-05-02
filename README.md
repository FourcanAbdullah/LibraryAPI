# LibraryAPI

* This is a primitive library API, please run the solution file install the nuget packages or run npm i if nessessary. 
* This API has two tables the Books table and the Borrowers table. 
* They have a One to One relationship. Every Book has one borrower and vice versa. 
* It has 3 main Endpoints:
    * /api/books
    * /api/borrowers
    * /api/books/{id}

* It has 4 HTTP methods:
* The Book Table has:
  	* Get: /api/books => will return you all books.
  	* Get{id}: /api/books/{id} => will return you book by id.
  	* Put: /api/books/{id} => will update the book based on Id, must include the bookId in the request body, also will not update the foriegn key.
  	* Post: /api/books => will add new book, works only if you dont add a borrower or if you add a new borrower, will not work if you try to connect with existing borrower. 
  		* If you create a new borrower, due to the constraint, Emails for borrowers must be unique. There is a foriegn key contraint as well 
  	* Delete: /api/books/{id} => will delete a book based on id
* The Borrower Table has:
  	* Get: /api/borrowers =>will return all borrowers.
  
* A sample request body for PUT in Books table:
``` {
            "bookId":9,
            "bookTitle": "David Copperfield",
            "bookAuthor": " Charles Dickens",
            "bookSummary": "David Copperfield is the story of a young man's adventures on his journey from an unhappy and impoverished childhood to the discovery of his vocation as a successful novelist. Among the gloriously vivid cast of characters he encounters are his tyrannical stepfather, Mr Murdstone; his brilliant, but ultimately unworthy school-friend James Steerforth; his formidable aunt, Betsey Trotwood; the eternally humble, yet treacherous Uriah Heep; frivolous, enchanting Dora Spenlow; and the magnificently impecunious Wilkins Micawber, one of literature's great comic creations. In David Copperfield - the novel he described as his 'favourite child' - Dickens drew revealingly on his own experiences to create one of the most exuberant and enduringly popular works, filled with tragedy and comedy in equal measure. This edition uses the text of the first volume publication of 1850, and includes updated suggestions for further reading, original illustrations by 'Phiz', a revised chronology and expanded notes. In his new introduction, Jeremy Tambling discusses the novel's autobiographical elements, and its central themes of memory and identity.",
            "isBorrowed": false
  } 
```
* for Post:
```  {
            "bookTitle": "The Bell Jar",
            "bookAuthor": "Sylvia Plath",
            "bookSummary": "The Bell Jar chronicles the crack-up of Esther Greenwood: brilliant, beautiful, enormously talented, and successful, but slowly going under—maybe for the last time. Sylvia Plath masterfully draws the reader into Esther's breakdown with such intensity that Esther's insanity becomes completely real and even rational, as probable and accessible an experience as going to the movies. Such deep penetration into the dark and harrowing corners of the psyche is an extraordinary accomplishment and has made The Bell Jar a haunting American classic.",
            "isBorrowed": true,
            "borrower": {
                "borrower_FirstName":"Juliana",
                "borrower_LastName": "Ackerman",
                "borrower_Email": "JAisnot@hotmail.com",
                "CurrentlyBorrowing": true
            }
}
```
* or:
```
{
            "bookTitle": "David Copperfield",
            "bookAuthor": " Charles Dickens",
            "bookSummary": "David Copperfield is the story of a young man's adventures on his journey from an unhappy and impoverished childhood to the discovery of his vocation as a successful novelist. Among the gloriously vivid cast of characters he encounters are his tyrannical stepfather, Mr Murdstone; his brilliant, but ultimately unworthy school-friend James Steerforth; his formidable aunt, Betsey Trotwood; the eternally humble, yet treacherous Uriah Heep; frivolous, enchanting Dora Spenlow; and the magnificently impecunious Wilkins Micawber, one of literature's great comic creations. In David Copperfield - the novel he described as his 'favourite child' - Dickens drew revealingly on his own experiences to create one of the most exuberant and enduringly popular works, filled with tragedy and comedy in equal measure. This edition uses the text of the first volume publication of 1850, and includes updated suggestions for further reading, original illustrations by 'Phiz', a revised chronology and expanded notes. In his new introduction, Jeremy Tambling discusses the novel's autobiographical elements, and its central themes of memory and identity.",
            "isBorrowed": false
            
        
}
```

* Response bodies generally look like this for both tables:
```
"statusCode":
"statusDescription":
"bookslist":[]
"borrowerslist:[]
```

* Ex: GET: https://localhost:7183/api/books/4
```
{
    "statusCode": 200,
    "statusDescription": "Status Ok, SHould recieve values",
    "bookslist": [
        {
            "bookId": 4,
            "bookTitle": "The Odyssey ",
            "bookAuthor": " Homer",
            "bookSummary": "the Odyssey is literature's grandest \n  evocation of everyman's journey though life. Odysseus' reliance on his wit and wiliness for survival in his encounters with divine and natural \n  forces, during his ten-year voyage home to Ithaca after the Trojan War, is at once a timeless human story and an individual test of moral \n  endurance. ",
            "isBorrowed": true,
            "borrower": {
                "borrowerId": 2,
                "borrower_FirstName": "Bob",
                "borrower_LastName": "McDon",
                "borrower_Email": "BobMcDon@gmail.com",
                "currentlyBorrowing": true
            }
        }
    ],
    "borrowerslist": []
}
```

        
    
  
