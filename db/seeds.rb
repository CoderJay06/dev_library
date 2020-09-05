# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

book1 = Book.create(title: "Pragmatic Programmer", 
                    author: "Dave Thomas & Andy Hunt", 
                    description: "The Pragmatic Programmer: From Journeyman to Master is a book about computer 
                    programming and software engineering, written by Andrew Hunt and David Thomas and published 
                    in October 1999. It is used as a textbook in related university courses. It was the first in 
                    a series of books under the label The Pragmatic Bookshelf.", 
                    release_date: 1999, 
                    category_id: category2.id)
book2 = Book.create(title: "Introduction to Algorithms", 
                    author: "Thomas Cormen", 
                    description: "ntroduction to Algorithms is a book on computer programming by Thomas H. Cormen, 
                    Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein. The book has been widely used as 
                    the textbook for algorithms courses at many universities",
                    release_date: 1992, 
                    category_id: category1.id)
book3 = Book.create(title: "Code Complete", 
                    author: "Steve McConnell", 
                    description: "Code Complete is a software development book, written by Steve McConnell and published 
                    in 1993 by Microsoft Press, encouraging developers to continue past code-and-fix programming and the 
                    big design up front and waterfall models",
                    release_date: 2001, 
                    category_id: category2.id)
book4 = Book.create(title: "Cracking the Coding Interview", 
                    author: "Gayle Laakmann McDowell", 
                    description: "Now in the 6th edition, Cracking the Coding Interview gives you the interview preparation 
                    you need to get the top software developer jobs.",
                    release_date: 2019, 
                    category_id: category1.id)
book5 = Book.create(title: "Clean Code: A Handbook of Agile Software Craftsmanship", 
                    author: "Robert C. Martin", 
                    description: "Every year, countless hours and significant resources are lost because of poorly written code. 
                    But it doesn't have to be that way. Noted software expert Robert C. Martin presents a revolutionary paradigm 
                    with Clean Code: A Handbook of Agile Software Craftsmanship .",
                    release_date: 2009, 
                    category_id: category2.id)