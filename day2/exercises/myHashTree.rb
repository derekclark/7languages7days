class Tree
  	attr_accessor :child_nodes, :name
	def initialize(treeData)
		puts "tree size= #{treeData.size}"
=begin
		save current node value to @name
=end	
		@name=treeData.keys()[0]
		puts "adding key-value pair #{@name}"
=begin
		create empty array to hold this name's children
=end	

		@child_nodes=[]
=begin
		go to each of this node's children and add it to the children array.
		For each child create a new Tree object. This will call Tree.initialize
		which will recursively descend the tree
=end	
		treeData[@name].each {|key,value|
			@child_nodes.push(
				Tree.new( key => value)
			)

		puts "#{@name} size= #{@child_nodes.size}"
		}

	end

	def visit_all(&block)
		visit &block
		child_nodes.each {|c| c.visit_all &block}
	end

	def visit(&block) 
		block.call self
	end 
end

puts "*************************************************"
puts "simple tree"
simple_tree = Tree.new({"dad" => {"son" => {}}})

puts "*************************************************"
puts "complex tree"
ruby_tree = Tree.new({
 "grandpa" => {
            "dad" => {
                "child1" => {},
                "child2" => {}
            },
            "uncle" => {
                "child3" => {},
                "child4" => {}
            }
        }

	})

puts 'visiting node'
ruby_tree.visit {|node| puts node.name}

puts 'visiting all nodes'
ruby_tree.visit_all {|node| puts node.name}