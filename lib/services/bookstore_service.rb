require 'C:\Users\prath\OneDrive\Desktop\allbookstore\lib\services\bookstore\creator.rb'
require 'C:\Users\prath\OneDrive\Desktop\allbookstore\lib\services\bookstore\destroyer.rb'
module BookstoreLogic

 class Bookstore_Service
  attr_reader :errors

    def initialize(params: nil, id: nil)
      @params = params
      @id=id
    end

    def create_bookstore
     res=BookstoreLogic::Creator.new(@params).call
    end

    def update_bookstore(bookstore)
      unless bookstore.update(@params)
         { success: false, message: "Could not update bookstore" }   
      else
        { success: true,message: "Bookstore updated successfully" }
      end
    end

    def delete_bookstore
        BookstoreLogic::Destroyer.new(@id).call
    end
 end
end
