class Missing
	def self.method_missing name, *args
		meth = name.to_s
		puts meth
	end
end

m=Missing.new
puts Missing.one
