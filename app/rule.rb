class Rule
  attr_accessor :number, :operation, :classification, :aliquot

  def initialize(number, operation, classification,aliquot)
    @number,@operation,@classification, @aliquot = number, operation, classification, aliquot.to_f
  end
end