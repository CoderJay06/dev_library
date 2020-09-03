# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
  - A Category has many books.
  
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  - A Review belongs to a book and a User.
  
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
  - A User has many Books through Downloads.
  
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  - A User has many Books through Downloads, A Book has many Users through Downloads.

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  - The through part of A User has many Books through Downloads  includes submittable attribute download.price if the user is an admin.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - User, Book, Category and Review models all include validations.
  
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  - Book model has a scope method for displaying the most recently added books.

- [x] Include signup
  - User signup form included.
  
- [x] Include login
  - Sessions login form included.
  
- [x] Include logout
  - Sessions logout form included.
  
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  - App uses Omniauth, specifically Google OAuth-2 for signinup/login.
  
- [x] Include nested resource show or index (URL e.g. users/2/lrecipes)
  - Includes nested resource for user reviews: users/1/reviews.
  
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  - Includes nested resource for new review form: books/1/reviews/new.

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  - Includes form display validation errors on all necessary forms(new, create) by rendering a locals partial containing the errors.
  
Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
