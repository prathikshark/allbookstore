require '/Users/prkoteshwara/allbookstore/lib/services/bookstore_service.rb'

class BookstoreController < ApplicationController
 def index
    @bookstores = Bookstore.all
 end

 def new
    @bookstore = Bookstore.new
 end

 def create
      service=BookstoreLogic::Bookstore_Service.new(bookstore_params)
      result = service.create_bookstore

      if result.errors.any?
         flash.now[:alert] = result.errors.join(', ')
         render :new
      else
         redirect_to showbs_path
         flash.now[:alert] = "Bookstore added successfully"
      end

 end

 
 def destroy
    @bookstore = Bookstore.find(params[:id])
    service = BookstoreLogic::BookstoreActions.new({})
    result = service.delete_bookstore(@bookstore)

    unless result[:success]
      flash[:alert] = "Could not delete bookstore"
      redirect_to showbs_path
    else
      flash[:alert] = result[:message]
      redirect_to showbs_path
    end
 end

 def edit
    @bookstore = Bookstore.find(params[:id])
 end

 def update
    @bookstore = Bookstore.find(params[:id])
    service = BookstoreLogic::BookstoreActions.new(bookstore_params)
    result = service.update_bookstore(@bookstore)
    unless result[:success]
      flash[:alert] = result[:message]
      render :edit
    else
      flash[:notice] = result[:message]
      redirect_to showbs_path
    end
 end

 private

 def bookstore_params
    params.require(:bookstore).permit(:name, :address, :phone, :email, :image)
 end
end


