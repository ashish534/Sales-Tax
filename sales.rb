$LOAD_PATH << '.'
require "calculate_tax"

module Sales
  EXEMPTED_LIST = Hash["pills" => "medical",
                       "tablets" => "medical",
                       "chocolates" => "food",
                       "book" => "books",
                       "milk" => "food", 
                       "chocolate" => "food"]

  class Sales_tax
    include Tax_cal
    @@total_collection = 0
    attr_accessor :goods_count, :goods_price, :total_tax, :total_price 
    def initialize(val) 
      @goods_count = val
      @goods_price = val
      @total_tax = val
      @total_price = val
    end

    def get_total_collection
      @@total_collection
    end
    def is_imported(input)
      input.each do |x|
        return 1 if x == "imported" 
      end
      return 0
    end

    def is_exempted(input)
      input.each do |x|
        return 0 if EXEMPTED_LIST.has_key?(x)  
      end
      return 1
    end

    def cal_tax(exp, imp)
      tax = Tax_cal::Calculate_tax.calculate(goods_count, goods_price, exp, imp)
      self.total_tax += tax 
      cost = Tax_cal::Calculate_total.calculate(goods_count, goods_price) + tax
      self.total_price += cost
      @@total_collection += total_price
      cost
    end
  end
end

