def bubble_sort 
	puts "Insert a numerical array to sort:"
	array = gets.chomp.gsub(/[^0-9,]/, "").split(",").collect!{|x| x.to_i}
	sorted = false
	until sorted
		i = 0
		sorted = true
		(array.length-1).times do
			if array[i] > array[i+1]
				array[i], array[i+1] = array[i+1], array[i]
				sorted = false
			end
			i +=1
		end
	end
	print "Your numerical array has been sorted: #{array}"
end

def bubble_sort_by
	puts "Enter your array to sort"
	array = gets.chomp.gsub(/[^A-z0-9\,]/, "").strip.split(",") 
	sorted = false
	until sorted
		i = 0
		sorted = true
		(array.length-1).times do
			if yield(array[i], array[i+1]) > 0
				array[i], array[i+1] = array[i+1], array[i]
				sorted = false
			end
			i +=1
		end
	end
	print "Your array has been sorted: #{array} with the block \"do |left,right|
	 left.length - right.length"
end



def go
	puts "Which module do you want to run: \"bubble_sort\" or \"bubble_sort_by\" ?"
	choice = gets.chomp.downcase

	choice == "bubble_sort" ?  bubble_sort : bubble_sort_by {|left,right| left.length - right.length}
end

go
