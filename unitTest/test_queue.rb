require 'minitest/autorun'
require './myQueue'
require './element'
class Testqueue < Minitest::Unit::TestCase
	def setup
		@queue = MyQueue.new
		@medium_priority_test_message = Element.new(11,100)
		@low_priority_test_message = Element.new(91,100)
		@high_priority_test_message = Element.new(1,100)
  	end

	def test_empty_queue_has_zero_size
		assert_equal 0,@queue.size
	end

 	def test_queue_is_empty
		assert_equal true,@queue.empty?
	end

	def test_add_increases_size_by_1
   		add_to_queue("something")
		assert_equal 1,@queue.size
	end

	def test_remove_decreases_size_by_1
		add_to_queue("something")
		assert_equal 1,@queue.size
		@queue.remove
		assert_equal 0,@queue.size
	end

	def test_remove_returns_element
		add_to_queue("something")
		assert_equal "something", @queue.remove
	end

	def test_remove_returns_last_added_element
		add_to_queue(1)
		add_to_queue(2)
		assert_equal 2,@queue.remove
	end

	def test_peeking_at_last_added_element
		add_to_queue(1)
		add_to_queue(2)
		assert_equal 2,@queue.peek
	end

	def test_peeking_does_not_change_queue_size
		add_to_queue(1)
		add_to_queue 2
		assert_equal 2,@queue.size
		@queue.peek
		assert_equal 2,@queue.size
	end
	
 	def add_to_queue(content)
		@queue.add(content)
	end
=begin
	def test_setting_high_priority
		assert_equal "high",@high_priority_test_message.getPriority()
	end

	def test_setting_medium_priority
		assert_equal "medium",@medium_priority_test_message.getPriority()
	end

	def test_setting_low_priority
		assert_equal "low",@low_priority_test_message.getPriority()
	end
=end
	def test_add_element_to_queue
		add_to_queue(@high_priority_test_message)
 		assert_equal 1, @queue.size
	end

	def test_removing_element_off_queue
		add_to_queue(@high_priority_test_message)
		assert_equal @high_priority_test_message, @queue.remove
	end

	def test_high_comes_before_low_messages
		add_to_queue(@high_priority_test_message)
		add_to_queue(@low_priority_test_message)
		assert_equal @high_priority_test_message, @queue.remove
	end

	def test_high_comes_before_medium_messages
		add_to_queue(@high_priority_test_message)
		add_to_queue(@medium_priority_test_message)
		assert_equal @high_priority_test_message, @queue.remove
	end

	def test_medium_comes_before_low_messages
		add_to_queue(@low_priority_test_message)
		add_to_queue(@medium_priority_test_message)
		assert_equal @medium_priority_test_message, @queue.remove
	end

	def test_correct_sequencing_for_multiple_messages
		add_to_queue(@medium_priority_test_message)
		add_to_queue(@high_priority_test_message)
		add_to_queue(@low_priority_test_message)
		assert_equal @high_priority_test_message, @queue.remove
		assert_equal @medium_priority_test_message, @queue.remove
		assert_equal @low_priority_test_message, @queue.remove
	end


end
