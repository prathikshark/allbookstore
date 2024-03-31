class HomeController < ApplicationController
 def index
    @bookstores=Bookstore.all
 end
end