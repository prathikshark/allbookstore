require 'test_helper'
require 'minitest/autorun'
require '/Users/prkoteshwara/hello/allbookstore/lib/services/bookstore/destroyer.rb'

class BookstoreCreatorTest < Minitest::Test
    def setup
      @subject = BookstoreLogic::Destroyer
    end   
  
    def test_success_destroy
      id = 1
      bookstore_object_mock = Minitest::Mock.new
      bookstore_object_mock.expect(:destroy, true)
      puts "===="
      bookstore_class_mock = Minitest::Mock.new
      bookstore_class_mock.expect(:find_by, bookstore_object_mock,[id])
  
      test_object = @subject.new(id, bookstore_class_mock)
      assert_equal true, test_object.call

      puts "========"
    end
  end