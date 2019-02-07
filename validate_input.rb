module Validate
  def check(input, type)
    # input.split.each do |ch|
    #   if (('a'..'z') === ch) || (('A'..'Z') === ch)
    #     return -1 
    #   end
    # end

    # return input.to_f

    begin
      type == 0 ? Integer(input) : Float(input)
    rescue
      -1
    end
  end
end

