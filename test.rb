print Integer("1")



class A

	name

	def self.method
		self
	end

	def meth2
		self.name
	end

end

a = A.new(name: 'test')

a.meth2