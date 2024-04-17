module BookstoreLogic
    class Destroyer

        attr_reader :errors

        def initialize(id, bookstore_class = Bookstore)
            @id = id 
            @bookstore_class = bookstore_class
        end

        def call
            bookstore = @bookstore_class.find_by(id: @id)
            @errors = bookstore.errors.full_messagess unless bookstore && bookstore.destroy
            self
          end
    end
 end
