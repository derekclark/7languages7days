class Element
	attr_accessor :priority, :uom
	def initialize(priority, uom)
		@priority=priority
		@uom=uom
	end

	def setPriority(value)
		@priority = value
	end

=begin
	def getPriority()
		if @priority < 11
			"high"
		elsif @priority < 91
			"medium"
		else
			"low"
		end
	end
=end
	def <=>(other)
    	other.priority <=> @priority
  	end	
end
