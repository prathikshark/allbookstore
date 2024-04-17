module BookstoreLogic
    class Destroyer

        attr_reader :errors

        def initialize(id, bookstore_class = Bookstore)
            @id = id 
            @bookstore_class = bookstore_class
        end

        def call
            bookstore = @bookstore_class.find_by(id: @id)
            if bookstore && bookstore.destroy
                return true
            else
                 errors = bookstore.errors.full_messages
                 return errors
             end
        end
 end
end


#   bookstore = @bookstore_class.new(@params)
#             if bookstore.save
#                 return true
#             else
#                 errors = bookstore.errors.full_messages
#                 return errors
#             end