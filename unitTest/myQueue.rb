class MyQueue
	attr_accessor :queue
	def initialize
 		@queue=[]
	end

	def add(message)
		@queue.push(message)
	end

    def remove
    	@queue.sort!
		@queue.pop
	end

	def peek
		@queue[-1]
	end

	def size
		@queue.size
	end

	def empty?
		@queue.empty?
	end
end
