module BookstoreLogic
    class Creator

        attr_reader :errors

        def initialize(params, bookstore_class = Bookstore)
            @params = params 
            @bookstore_class = bookstore_class
        end

        def call
            bookstore = @bookstore_class.create(@params)
            @errors = bookstore.errors.full_messages unless bookstore.save
            self
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