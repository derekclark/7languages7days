=begin
MiniTest also supports the option of writing tests in the expectation style. If you’ve used RSpec, the syntax is similar and you’ll feel right at home with describe and it blocks.
=end

require 'minitest/autorun'
require './stack.rb'

describe Stack do
	before do
		@stack=Stack.new
	end

	it "will return zero size when stack is empty" do
		@stack.size.must_equal 0
	end

     	it "will add one to size when elements are added" do
		@stack.add(1)
		@stack.size.must_equal 1
	end
end	
