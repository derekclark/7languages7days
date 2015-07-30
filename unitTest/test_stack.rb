require 'minitest/autorun'
require './stack'
class TestStack < Minitest::Unit::TestCase
	def setup
		@stack = Stack.new
  	end

	def test_empty_stack_has_zero_size
		assert_equal 0,@stack.size
	end

 	def test_empty_stack_is_created
		assert_equal [],@stack.stack
	end

	def test_add_increases_size_by_1
   		add_to_stack("something")
		assert_equal 1,@stack.size
	end

	def test_remove_decreases_size_by_1
		add_to_stack("something")
		assert_equal 1,@stack.size
		@stack.remove
		assert_equal 0,@stack.size
	end

	def test_remove_returns_element
		add_to_stack("something")
		assert_equal "something", @stack.remove
	end

	def test_remove_returns_last_added_element
		add_to_stack(1)
		add_to_stack(2)
		assert_equal 2,@stack.remove
	end

	def test_peeking_at_last_added_element
		add_to_stack(1)
		add_to_stack(2)
		assert_equal 2,@stack.peek
	end

	def test_peeking_does_not_change_stack_size
		add_to_stack(1)
		add_to_stack 2
		assert_equal 2,@stack.size
		@stack.peek
		assert_equal 2,@stack.size
	end
	
 	def add_to_stack(content)
		@stack.add(content)
	end
end
