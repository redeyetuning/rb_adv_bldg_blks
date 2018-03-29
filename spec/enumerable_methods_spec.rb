require "enumerable_methods"

describe Array do
	
	describe ".my_map" do

		context "Apllied to single entry array with no block" do
			it "returns Enumerator" do
				expect(["hello"].my_map).to be_instance_of(Enumerator)
			end
		end

		context "Apllied to multi-entry array with block but without iterator" do
			it "returns block contents for each iteration" do
				expect([0,1,2,3,4].my_map{"hello"}).to eql(["hello","hello","hello","hello","hello"])
			end
		end 

		context "Applied to single entry array with block {|x| x}" do
			it "returns unchanged array" do
				expect(['hello'].my_map{|x| x}).to eql(["hello"])
			end
		end

		context "Applied to multi-entry string array with block {|x| x.upcase}  " do
			it "returns array upcased" do
				expect(["hello","world"].my_map{|x| x.upcase}).to eql(["HELLO", "WORLD"])
			end	
		end	

		context "Applied to numerical array with block {|x| x*x}" do
			it "returns array of squared numbers" do
				expect([1,2,3,4].my_map{|x| x*x}).to eql([1,4,9,16])
			end 
		end
	
		context "Applied to nested arrays with nested 'my_select' in block" do
			it "returns array with my_select items only" do
			expect([[1,2],[3,4]].my_map{|x| x.my_select{|y| y%2 == 0}}).to eql([[2],[4]])
			end
		end
	end
end