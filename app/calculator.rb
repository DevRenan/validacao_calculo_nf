class Float
  def round_down(n=0)
    ((self * 10**n).to_i).to_f/10**n 
  end
end

class Calculator
  def self.calculate_value_tax(value, aliquot)
    value_tax = format("%.2f", (value * aliquot / 100).round_down(2))
    value_tax
  end
end