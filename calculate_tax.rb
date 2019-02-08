module Tax_cal

  def calculate(item, price, exp, imp)
    (((item * price) * 0.10) * exp) + (((item * price) * 0.05) * imp)
  end
  
end 