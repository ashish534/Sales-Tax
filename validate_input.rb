module Validate
  def check(input, type)
    begin
      type == 0 ? Integer(input) : Float(input)
    rescue
      -1
    end
  end
end