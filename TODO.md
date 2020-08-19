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
   