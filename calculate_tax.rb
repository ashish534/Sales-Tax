module Tax_cal
	class Calculate_tax
    def self.calculate(item, price, exp, imp)
      (((item * price) * 0.10) * exp) + (((item * price) * 0.05) * imp)
    end
  end
  class Calculate_total < Calculate_tax
    def self.calculate(item, price)
    	item * price
    end
  end
  
end 