class Invoice
  attr_accessor :number, :operation, :classification, :value, :value_tax

  def initialize(number, operation, classification, value, value_tax)
    @number,@operation,@classification, @value, @value_tax = number, operation, classification, value.to_f, value_tax.to_f
  end

  def match?(rule)
    (self.operation == rule.operation || rule.operation == "*") &&
    (self.classification == rule.classification || rule.classification == "*")
  end
end