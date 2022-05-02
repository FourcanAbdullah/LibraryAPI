create database librarydb;

use librarydb;

create table Books(
	BookId int not null auto_increment,
    BookTitle varchar(1000) not null,
    BookAuthor varchar(1000) not null,
    BookSummary varchar(10000),
    IsBorrowed boolean,
    primary key (BookId)
); 

create table Borrowers(
	BorrowerId int not null auto_increment,
    Borrower_FirstName varchar(1000) not null,
    Borrower_LastName varchar(1000) not null,
    CurrentlyBorrowing boolean,
    Borrower_Email varchar(100) not null,
    primary key (BorrowerId)

);
alter table Books add column BorrowerId int;
alter table Books add constraint Fk_Borrower foreign key (BorrowerId) references Borrowers(BorrowerId);
ALTER TABLE Borrowers ADD CONSTRAINT UniqueEmail UNIQUE (Borrower_Email);

insert into Borrowers (Borrower_FirstName, Borrower_LastName, CurrentlyBorrowing, Borrower_Email) values ("John", "Doe", true, "JohnDoe21@gmail.com");
insert into Borrowers (Borrower_FirstName, Borrower_LastName, CurrentlyBorrowing, Borrower_Email) values ("Bob", "McDon", true, "BobMcDon@gmail.com");
insert into Borrowers (Borrower_FirstName, Borrower_LastName, CurrentlyBorrowing, Borrower_Email) values ("Millie", "Joehanes", true, "MilJoe23@gmail.com");
insert into Borrowers (Borrower_FirstName, Borrower_LastName, CurrentlyBorrowing, Borrower_Email) values ("Julia", "Ackerman", true, "JA@hotmail.com");
insert into Borrowers (Borrower_FirstName, Borrower_LastName, CurrentlyBorrowing, Borrower_Email) values ("Larry", "Doe", true, "LarryDoe21303@gmail.com");
insert into Borrowers (Borrower_FirstName, Borrower_LastName, CurrentlyBorrowing, Borrower_Email) values ("Kat", "Kit", false, "KatKit@gmail.com");
insert into Borrowers (Borrower_FirstName, Borrower_LastName, CurrentlyBorrowing, Borrower_Email) values ("Lucia", "Kit", false, "LuciaKit1@gmail.com");
insert into Books (BookTitle, BookAuthor, BookSummary, IsBorrowed) values ("David Copperfield", " Charles Dickens", "David Copperfield
 is the story of a young man's adventures on his journey from an unhappy and impoverished childhood to the discovery of his vocation as
 a successful novelist. Among the gloriously vivid cast of characters he encounters are his tyrannical stepfather, Mr Murdstone; his 
 brilliant, but ultimately unworthy school-friend James Steerforth; his formidable aunt, Betsey Trotwood; the eternally humble, yet
 treacherous Uriah Heep; frivolous, enchanting Dora Spenlow; and the magnificently impecunious Wilkins Micawber, one of literature's
 great comic creations. In David Copperfield - the novel he described as his 'favourite child' - Dickens drew revealingly on his own 
 experiences to create one of the most exuberant and enduringly popular works, filled with tragedy and comedy in equal measure. This 
 edition uses the text of the first volume publication of 1850, and includes updated suggestions for further reading, original illustrations 
 by 'Phiz', a revised chronology and expanded notes. In his new introduction, Jeremy Tambling discusses the novel's autobiographical elements,
 and its central themes of memory and identity.", true);
 
 insert into Books (BookTitle, BookAuthor, BookSummary, IsBorrowed) values ("To Kill a Mockingbird", "Harper Lee", "The unforgettable novel of a 
 childhood in a sleepy Southern town and the crisis of conscience that rocked it. To Kill A Mockingbird became both an instant bestseller and
 a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was 
 later made into an Academy Award-winning film, also a classic.", true);
 
 insert into Books (BookTitle, BookAuthor, BookSummary, IsBorrowed) values ("The Count of Monte Cristo ", "Alexandre Dumas", "Thrown in prison 
 for a crime he has not committed, Edmond Dantes is confined to the grim fortress of If. There he learns of a great hoard of treasure hidden on 
 the Isle of Monte Cristo and he becomes determined not only to escape, but also to unearth the treasure and use it to plot the destruction of 
 the three men responsible for his incarceration. ", true);
 
  insert into Books (BookTitle, BookAuthor, BookSummary, IsBorrowed) values ("The Odyssey ", " Homer", "the Odyssey is literature's grandest 
  evocation of everyman's journey though life. Odysseus' reliance on his wit and wiliness for survival in his encounters with divine and natural 
  forces, during his ten-year voyage home to Ithaca after the Trojan War, is at once a timeless human story and an individual test of moral 
  endurance. ", true);
 
 insert into Books (BookTitle, BookAuthor, BookSummary, IsBorrowed) values ("The Chronicles of Narnia", "C.S. Lewis", "Journeys to the end of the world, fantastic 
 creatures, and epic battles between good and evil—what more could any reader ask for in one book? The book that has it all is The Lion, 
 the Witch and the Wardrobe, written in 1949 by Clive Staples Lewis. But Lewis did not stop there. Six more books followed, and together 
 they became known as The Chronicles of Narnia.", true);
 
  insert into Books (BookTitle, BookAuthor, BookSummary, IsBorrowed) values ("Don Quixote", "Miguel de Cervantes Saavedra", "Don Quixote has become so entranced by reading chivalric 
  romances that he determines to become a knight-errant himself. In the company of his faithful squire, Sancho Panza, his exploits 
  blossom in all sorts of wonderful ways. While Quixote's fancy often leads him astray—he tilts at windmills, imagining them to be 
  giants—Sancho acquires cunning and a certain sagacity. Sane madman and wise fool, they roam the world together, and together they have 
  haunted readers' imaginations for nearly four hundred years.", false);
  
    insert into Books (BookTitle, BookAuthor, BookSummary, IsBorrowed) values ("Dune", "Frank Herbert", "Set on the desert planet Arrakis, Dune 
    is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the 
    spice melange, a drug capable of extending life and enhancing consciousness. Coveted across the known universe, 
    melange is a prize worth killing for...
	When House Atreides is betrayed, the destruction of Paul's family will set the boy on a journey toward a 
    destiny greater than he could ever have imagined. And as he evolves into the mysterious man known as Muad'Dib, he will bring to fruition 
    humankind's most ancient and unattainable dream.", false);
    
	insert into Books (BookTitle, BookAuthor, BookSummary, IsBorrowed) values ("Twenty Thousand Leagues Under the Sea", "Jules Verne", "When an unidentified “monster” threatens international shipping, 
    French oceanographer Pierre Aronnax and his unflappable assistant Conseil join an expedition organized by the US Navy to hunt down and 
    destroy the menace. After months of fruitless searching, they finally grapple with their quarry, but Aronnax, Conseil, and the brash Canadian 
    harpooner Ned Land are thrown overboard in the attack, only to find that the “monster” is actually a futuristic submarine, the Nautilus, 
    commanded by a shadowy, mystical, preternaturally imposing man who calls himself Captain Nemo. Thus begins a journey of 20,000 leagues—nearly 
    50,000 miles—that will take Captain Nemo, his crew, and these three adventurers on a journey of discovery through undersea forests, coral 
    graveyards, miles-deep trenches, and even the sunken ruins of Atlantis.", false);
 
update Books set BorrowerId = 1 where BookId = 1;
update Books set BorrowerId = 2 where BookId = 4;
update Books set BorrowerId = 3 where BookId = 5;
update Books set BorrowerId = 4 where BookId = 2;
update Books set BorrowerId = 5 where BookId = 3;