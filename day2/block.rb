def foo(&block)
	block.call if block_given?
end

foo do
	puts 'hello'
end