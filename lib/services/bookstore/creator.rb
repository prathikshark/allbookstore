module BookstoreLogic
    class Creator

        attr_reader :errors

        def initialize(params, bookstore_class = Bookstore)
            @params = params 
            @errors = nil
            @bookstore_class = bookstore_class
        end

        def call
            bookstore = @bookstore_class.new(@params)
            if bookstore.save
                return true
            else
                @errors = bookstore.errors.full_messages
                return @errors
            end
        end  

    end
 end


=begin
        def call
            bookstore = Bookstore.new(@params)
            @errors = bookstore.errors.full_messages unless bookstore.save
            self
        end   
=end