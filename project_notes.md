DEV LIBRARY

Models:

.User
   - has_many Subscriptions
   - has_many Books through: Subscriptions

.Book
   - has_many Reviews
   - belongs_to Category
   - has_many Subscriptions
   - has_many Users through: Subscriptions

.Category
   - has_many Books

.Review
   - belongs_to Book

.Subscription
   - belongs_to User
   - belongs_to Book


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