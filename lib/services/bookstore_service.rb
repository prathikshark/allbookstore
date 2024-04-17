require '/Users/prkoteshwara/hello/allbookstore/lib/services/bookstore/creator.rb'
require '/Users/prkoteshwara/hello/allbookstore/lib/services/bookstore/destroyer.rb'
module BookstoreLogic

 class Bookstore_Service
  attr_reader :errors

    def initialize(params: nil, id: nil)
      @params = params
      @id=id
    end

    def create_bookstore
      BookstoreLogic::Creator.new(@params).call
    end

    def update_bookstore
      if bookstore.update(@params)
        { success: true,message: "Bookstore updated successfully" }
      else
       { success: false, message: "Could not update bookstore" }   

      end
    end

    def delete_bookstore
        BookstoreLogic::Destroyer.new(@id).call
    end
 end
end
