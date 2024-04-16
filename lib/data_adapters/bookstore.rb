module DataAdapters
  class Bookstore
    def self.details(id)
      # Assuming Bookstore is an ActiveRecord model
      Bookstore.find_by(id: id)
    end
  end
end
