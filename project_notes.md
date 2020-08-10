DEV LIBRARY


Models:

.User
   - has_many Books
   - has_many Reviews
   - has_many Subscriptions
   - has_many Books through: Subscriptions

.Book
   - belongs_to User
   - has_many Reviews through: Users
   - has_many Categories
   - has_many Subscriptions
   - has_many Users through Subscriptions

.Category
   - has_many Books

.Review
   - belongs_to User
   - belongs_to Book

.Subscription
   - belongs_to User
   - belongs_to Book
