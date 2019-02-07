$LOAD_PATH << '.'
require "sales"
require "calculate_tax"
require "validate_input"
include Sales
include Tax_cal
include Validate

for j in (1..3)
  inputs = IO.readlines("./inputs/input#{j}.txt")
  len = inputs.length
  s_tax = Sales::Sales_tax.new(0)

  for i in (0...inputs.length)
  	valid = true
    inputs[i] = inputs[i].split

    if Validate::check(inputs[i].first, 0) != -1
    	count = Validate::check(inputs[i].first, 0)
    else
      inputs[i] = ["invalid input please enter correct input"] 
    	next
    end

    if Validate::check(inputs[i].last, 1) != -1
    	price = Validate::check(inputs[i].last, 1)
    else
      inputs[i] = ["invalid input please enter correct input"] 
    	next
    end
    
    s_tax.goods_count = count
    s_tax.goods_price = price

    exempted = s_tax.is_exempted(inputs[i])
    imported = s_tax.is_imported(inputs[i])

    cost = s_tax.cal_tax(exempted, imported)
    inputs[i][inputs[i].length - 1] = cost
  end

  inputs = inputs.collect {|line| line.join(' ')}

  inputs[len] = ["Sales Taxes: #{s_tax.total_tax}" ]
  inputs[len+1] = ["Total: #{s_tax.total_price}", ]

  puts "Output #{j} : \n", inputs, "\n"

end

print "Overall collection of the day #{s_tax.get_total_collection} \n"