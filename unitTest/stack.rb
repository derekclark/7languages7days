class Stack
	attr_accessor :size, :stack
	def initialize
		@size=0
 		@stack=[]
	end

	def add(content)
		@stack.push(content)
		@size=@size+1
	end

    def remove
		@size=@size-1
		@stack.pop
	end

	def peek
		@stack[-1]
	end

end
