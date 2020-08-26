Planning Dev Library App

Routes:

   GET '/signup'
      - should present user signup form
   
   POST '/signup'
      - creates the user and persists data to the db,
        validation included

   GET '/login'
      - renders user login form
   
   POST '/login'
      - logs in user and authenticates
   
   DELETE '/logout'
      - logs out the user

   GET '/books
      - should present books index page

   GET '/books/new'
      - should render page for creating a new book

   POST '/books/new'
      - creates new book and persists data to the db
        include validations

   GET '/books/:id'
      - should render books show page
   
   GET '/books/:id/edit'
      - should render form for editing a book 

   PATCH '/books/:id/edit' 
      - updates book
   
   GET '/categories/new'
      - should render page for creating a category
   
   POST '/categories/new'
      - creates new category

   GET '/books/:id/reviews/new'
      - render form to create new book reviews

   POST '/books/:id/reviews/new'
      - create new book review

   GET '/books/:id/reviews/:id/edit'
      - render form to edit book reviews

   PATCH '/books/:id/reviews/:id/edit'
      - edit book review

Refactor: 

* Refactor error display messages into partials
* Slim down controllers 
* Use helpers for view logic
* Refactor routes (use resources)