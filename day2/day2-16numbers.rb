myStack=[]
(1..16).each {|a|
	myStack.push(a)
	if (myStack.length ==4)
		puts myStack.join(",")
		myStack=[]
	end
}