class Array

	def my_each
		i=0
		while i < self.length
			yield(self[i])
			i += 1
		end
	return self
	end

	def my_each_with_index
		i=0
		while i < self.length
			yield(self[i],i)
			i += 1
		end
		return self
	end

	def my_select
		i = 0
		return_array = []
		while i < self.length
			return_array.push(self[i]) if yield(self[i])
			i +=1  
		end
		return return_array
	end

	def my_all?
	 	output = true
	 	self.my_each do |x|
	 		output = false unless yield(x) 
	 	end
	 	return output
	end

	def my_any?
		output = false
		self.my_each do |x|
			output = true if yield(x)
		end
		return output
	end

	def my_none?
		output = true
		self.my_each do |x|
			output = false if yield(x)
		end
		return output
	end

	def my_count
		output = 0
		self.my_each do |x|
			output += 1 if yield(x) 
		end
		return output
	end

	def my_map(proc=false)
		return self.to_enum('my_map') unless block_given? 
		i = 0
		return_array = []
		while i < self.length
			if proc
				return_array[i] = proc.call(self[i])
			else
				return_array[i] = yield(self[i])
			end
			i += 1
		end
		return return_array
	end

	def my_inject(value=0)
		total = value
		self.my_each do |x|
			total = yield(total,x)
		end
	return total
	end

end

def multiply_els array
	array.my_inject(1){|total, element| total*element}

end