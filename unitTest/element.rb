class Element
	attr_accessor :priority
	def initialize
		@priority=0
	end

	def setPriority(value)
		@priority = value
	end

	def getPriority()
		if @priority < 11
			"high"
		elsif @priority < 91
			"medium"
		else
			"low"
		end
	end
end
