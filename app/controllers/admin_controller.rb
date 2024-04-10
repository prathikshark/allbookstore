class AdminController < ApplicationController
def index
    @bookstore_count = Bookstore.count
    @book_count=Book.count
end

end