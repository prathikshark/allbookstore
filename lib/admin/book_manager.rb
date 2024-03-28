module Admin
    class BookManager
      attr_reader :params
  
      def initialize(params)
        @params = params
      end
  
      def create
        book = Book.new(params)
        if book.save
          book
        else
          puts book.errors.full_messages
          nil
        end
      end
  
      def delete_book(id)
        book = Book.find_by(id: id)
        book.destroy if book
      end

      def find_book
        Book.find(params[:id])
      end
  
      def update_book
        book = find_book
        if book.update(params.require(:book).permit(:name, :author, :quantity, :price, :description, :bookstore_id, :image))
          book
        else
          book.errors.full_messages.each { |message| puts message }
          nil
        end
      end


    end
  end
  