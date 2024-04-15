require '/Users/prkoteshwara/allbookstore/lib/services/bookstore/creator.rb'
module BookstoreLogic

 class Bookstore_Service

    def initialize(params)
      @params = params
    end

    def create_bookstore
     result=BookstoreLogic::Creator.new(@params).call
    end

    def update_bookstore(bookstore)
      unless bookstore.update(@params)
         { success: false, message: "Could not update bookstore" }   
      else
        { success: true,message: "Bookstore updated successfully" }
      end
    end

    def delete_bookstore(bookstore)
      bookstore.destroy
      { success: true, message: "Bookstore deleted successfully" }
    end
 end
end
