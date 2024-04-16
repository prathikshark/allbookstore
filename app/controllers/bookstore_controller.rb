require 'C:\Users\prath\OneDrive\Desktop\allbookstore\lib\services\bookstore_service.rb'

class BookstoreController < ApplicationController
 def index
    @bookstores = Bookstore.all
 end

 def new
    @bookstore = Bookstore.new
 end

 def create
      service=BookstoreLogic::Bookstore_Service.new(params: bookstore_params)
      result = service.create_bookstore

      if result.errors
         flash.now[:alert] = result[:errors].join(', ')
         render :new
       else
         redirect_to showbs_path
         flash[:notice] = "Bookstore added successfully"
       end

 end

 
 def destroy
   result = BookstoreLogic::Bookstore_Service.new(id: params[:id]).delete_bookstore

 
   #  @bookstore = Bookstore.find(params[:id])
   #  service = BookstoreLogic::Bookstore_Service.new({})
   #  result = service.delete_bookstore(@bookstore)
    if result.errors
      redirect_to showbs_path
      flash[:alert] = "Successfully deleted"
   else 
      redirect_to showbs_path
      # flash[:alert] = result.errors.join(', ')
   end
 end

 def edit
    @bookstore = Bookstore.find(params[:id])
 end

 def update
    @bookstore = Bookstore.find(params[:id])
    service = BookstoreLogic::Bookstore_Service.new(bookstore_params)
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


