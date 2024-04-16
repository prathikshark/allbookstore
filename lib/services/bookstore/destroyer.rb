module BookstoreLogic
    class Destroyer

        attr_reader :errors

        def initialize(id, bookstore_class = Bookstore)
            @id = id 
            @bookstore_class = bookstore_class
        end

        def call
            bookstore = Bookstore.find_by(id: @id)
            @errors = ['Bookstore not found or cannot be deleted.'] unless bookstore && bookstore.destroy
            self
          end
    end
 end
