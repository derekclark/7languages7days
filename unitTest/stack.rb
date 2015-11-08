class Stack
	attr_accessor :stack
	def initialize
 		@stack=[]
	end

	def add(content)
		@stack.push(content)
	end

    def remove
		@stack.pop
	end

	def peek
		@stack[-1]
	end

	def size
		@stack.size
	end
end
