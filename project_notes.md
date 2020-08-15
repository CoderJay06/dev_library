DEV LIBRARY

Models:

.User
   - has_many Subscriptions
   - has_many Books through: Subscriptions

   attributes:
      - first_name
      - last_name
      - username
      - email
      - password_digest


.Book
   - has_many Reviews
   - belongs_to Category
   - has_many Subscriptions
   - has_many Users through: Subscriptions

   attributes:
      - category_id
      - title
      - author
      - description
      - release_date

.Category
   - has_many Books

   attributes:
      - name

.Review
   - belongs_to Book

   attributes:
      - book_id
      - user_id
      - comment
      - rating

.Subscription
   - belongs_to User
   - belongs_to Book

   attributes:
      - user_id
      - book_id
      - months
      - type
      - price


Views:

.Layout
   - application
   - about

.Users
   - new
   - show

.Books
   - index
   - new
   - show

.Subscriptions
   - new 
   - edit
   - show

.Reviews
   - index
   - new
   - edit

.Sessions
   - home
   - new