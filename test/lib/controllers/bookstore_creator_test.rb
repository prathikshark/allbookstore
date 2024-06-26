require 'test_helper'
require 'minitest/mock'
require 'minitest/autorun'
require '/Users/prkoteshwara/hello/allbookstore/lib/services/bookstore/creator.rb'

class BookstoreCreatorTest < Minitest::Test
    
    def setup
        @params = {name: nil, email:"BS1@gmail.com", address:"A1", phone: "1234567890"}
        @sub = BookstoreLogic::Creator
        @bs_instance_mock = Minitest::Mock.new()
        @bs_mock = Minitest::Mock.new()
        @test_object = @sub.new(@params, @bs_mock)
    end    

    def test_create_record_bool
        @bs_instance_mock.expect :save, true
        @bs_mock.expect :new, @bs_instance_mock, [@params]
        assert_equal true, @test_object.call()
        print "'test_create_record_bool' PASS\n"
    end

    def test_create_record_fail
        err =['Error While creating record!!!!']
        @errors_mock=Minitest::Mock.new()
        @errors_mock.expect :full_messages, err
        @bs_instance_mock.expect :save, false
        @bs_instance_mock.expect :errors, @errors_mock
        @bs_mock.expect :new, @bs_instance_mock, [@params]  
        assert_equal err ,@test_object.call()
        puts err
    end

end    