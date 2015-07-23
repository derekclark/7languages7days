class Tree
  	attr_accessor :child_nodes, :name
	def initialize(treeData)

		puts treeData.size 
		@name=treeData.keys()[0]
		puts "adding key-value pair #{@name}"

		@child_nodes=[]
		treeData[@name].each {|key,value|
			@child_nodes.push(
				Tree.new( key => value)
			)

		puts "#{@name} size= #{@child_nodes.size}"
		}

	end
	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end
	def visit(&block) 
		block.call self
	end 
end

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