class MyComplex
	attr_accessor:real, :img
	@@add_counter=0
	@@mult_counter=0
	@@add_bulk_counter=0
	@@mult_bulk_counter=0

	def initialize(real,img)
		@real = real
		@img = img
	end
	def printMyComplex()

		if @img.positive? 
			puts puts @real.to_s+"+"+@img.to_s+"i"
		else
			puts puts @real.to_s+@img.to_s+"i"
		end
		# puts @real.to_s+ @img.positive? ? "+"+@img+"i" : +@img+"i"
		# puts @real.to_s+@img.to_s+"i"
	end

	def +(obj)
		@@add_counter+=1
		MyComplex.new(@real+obj.real,@img+obj.img)
	end

	def *(obj)
		@@mult_counter+=1
		real = (@real*obj.real) - (@img*obj.img)
		img = (@real*obj.img) + (@img*obj.real)
		MyComplex.new(real,img)
	end

	def self.bulk_add(arr)
		@@add_bulk_counter+=1
		temp = MyComplex.new(0,0)
		arr.each do |num|
			@@add_counter-=1
			temp+=num
		end
		temp
	
	end

	def self.bulk_multiply(arr)
		@@mult_bulk_counter+=1
		temp = MyComplex.new(0,0)
		arr.each do |num|
			@@mult_counter-=1
			temp*=num
		end
		temp
	
	end
	def self.get_stats()
		puts "add function has been called "+@@add_counter.to_s+" times"
		puts "multiply function has been called "+@@mult_counter.to_s+" times"
		puts "add bulk function has been called "+@@add_bulk_counter.to_s+" times"
		puts "multiply bulk function has been called "+@@mult_bulk_counter.to_s+" times"
	end


end

num1 = MyComplex.new(3,2)
num1.printMyComplex()
num2 = MyComplex.new(1,7)
num2.printMyComplex()
num3 = num1+num2
num3.printMyComplex()
num4 = num1*num2
num4.printMyComplex()
num10=num1*num2

puts "************************************************************"

arr=[]
arr.push(num1)
arr.push(num2)
arr.push(num3)
arr.push(num4)
####################################################################

num6=MyComplex.bulk_add(arr)
num6.printMyComplex()

####################################################################

num6=MyComplex.bulk_multiply(arr)
num6.printMyComplex()
######################################################################
MyComplex.get_stats()