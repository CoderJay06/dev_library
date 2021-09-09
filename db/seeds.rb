# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Prevent duplicating seed data
User.destroy_all
Category.destroy_all
Author.destroy_all
Book.destroy_all

user1 = User.create(first_name: "Jay", 
                    last_name: "Cru", 
                    email: "jjc@email.com", 
                    email_confirmation: "jjc@email.com",
                    username: "coderJC", 
                    password: "jc1234",
                    password_confirmation: "jc1234")
user2 = User.create(first_name: "Mike", 
                    last_name: "Jones", 
                    email: "mj@email.com", 
                    email_confirmation: "mj@email.com",
                    username: "mJones", 
                    password: "mj1234",
                    password_confirmation: "mj1234")
user3 = User.create(first_name: "Mary", 
                    last_name: "Poppins", 
                    email: "marryp@email.com", 
                    email_confirmation: "marryp@email.com",
                    username: "marryP", 
                    password: "mp1234",
                    password_confirmation: "mp1234")
user4 = User.create(first_name: "Donald",
                    last_name: "Knuth",
                    username: "dknuth",
                    email: "dknuth@mail.com",
                    email_confirmation: "dknuth@mail.com",
                    password: "dk123",
                    password_confirmation: "dk123",
                    admin: true)



category1 = Category.create(name: "Computer Science")
category2 = Category.create(name: "Software Development")
category3 = Category.create(name: "Software Engineering")

author1 = Author.create(name: "Dave Thomas & Andy Hunt")
author2 = Author.create(name: "Thomas Cormen")
author3 = Author.create(name: "Steve McConnell")
author4 = Author.create(name: "Gayle Laakmann McDowell")
author5 = Author.create(name: "Robert C. Martin")
author6 = Author.create(name: "Fredrick P. Brooks")
author7 = Author.create(name: "Kent Beck")

book1 = Book.create(title: "Pragmatic Programmer", 
                    author_id: author1.id, 
                    description: "The Pragmatic Programmer: From Journeyman to Master is a book about computer 
                    programming and software engineering, written by Andrew Hunt and David Thomas and published 
                    in October 1999. It is used as a textbook in related university courses. It was the first in 
                    a series of books under the label The Pragmatic Bookshelf.", 
                    release_date: "1999-01-08", 
                    category_id: category2.id)
book2 = Book.create(title: "Introduction to Algorithms", 
                    author_id: author2.id, 
                    description: "ntroduction to Algorithms is a book on computer programming by Thomas H. Cormen, 
                    Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein. The book has been widely used as 
                    the textbook for algorithms courses at many universities",
                    release_date: "1992-01-08", 
                    category_id: category1.id)
book3 = Book.create(title: "Code Complete", 
                    author_id: author3.id, 
                    description: "Code Complete is a software development book, written by Steve McConnell and published 
                    in 1993 by Microsoft Press, encouraging developers to continue past code-and-fix programming and the 
                    big design up front and waterfall models",
                    release_date: "2001-01-08", 
                    category_id: category2.id)
book4 = Book.create(title: "Cracking the Coding Interview", 
                    author_id: author4.id, 
                    description: "Now in the 6th edition, Cracking the Coding Interview gives you the interview preparation 
                    you need to get the top software developer jobs.",
                    release_date: "2019-01-08", 
                    category_id: category1.id)
book5 = Book.create(title: "Clean Code: A Handbook of Agile Software Craftsmanship", 
                    author_id: author5.id, 
                    description: "Every year, countless hours and significant resources are lost because of poorly written code. 
                    But it doesn't have to be that way. Noted software expert Robert C. Martin presents a revolutionary paradigm 
                    with Clean Code: A Handbook of Agile Software Craftsmanship .",
                    release_date: "2009-01-08", 
                    category_id: category2.id)
book6 = Book.create(title: "The Mythical Man-Month: Essays on Software Engineering", 
                    author_id: author6.id, 
                    description: "a book on software engineering and project management by Fred Brooks first published in 1975, 
                    with subsequent editions in 1982 and 1995. Its central theme is that 'adding manpower to a late software 
                    project makes it later'. This idea is known as 'Brooks law', and is presented along with the second-system 
                    effect and advocacy of prototyping.",
                    release_date: "1995-01-08", 
                    category_id: category3.id)
book7 = Book.create(title: "Refactoring: Improving the Design of Existing Code", 
                    author_id: author7.id, 
                    description: "Your class library works, but could it be better? Refactoring: Improving the Design of Existing 
                    Code shows how refactoring can make object-oriented code simpler and easier to maintain. Today refactoring 
                    requires considerable design know-how, but once tools become available, all programmers should be able to 
                    improve their code using refactoring techniques.",
                    release_date: "1999-01-08", 
                    category_id: category2.id)
book8 = Book.create(title: "Agile Software Development : Principles, Patterns, and Practices", 
                    author_id: author5.id, 
                    description: "Written by a software developer for software developers, this book is a unique collection of the 
                    latest software development methods. The author includes OOD, UML, Design Patterns, Agile and XP methods with a 
                    detailed description of a complete software design for reusable programs in C++ and Java. Using a practical, 
                    problem-solving approach, it shows how to develop an object-oriented application from the early stages of analysis, 
                    through the low-level design and into the implementation.",
                    release_date: "2002-01-08", 
                    category_id: category2.id)