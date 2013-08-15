class Validator
  require './csv_reader.rb'
  require './calculator.rb'
  require './csv_writer.rb'

  ENTRY_FILENAME = "../csv_files/entry.csv"
  RULE_FILENAME = "../csv_files/rules.csv"

  def check
    lines = []
    load_invoices.each do |invoice|
      load_rules.each do |rule|
        puts invoice.number
        puts rule.number
        if invoice.match?(rule)
          value_tax = Calculator.calculate_value_tax(invoice.value, rule.aliquot)
          result = value_tax == format("%.2f",invoice.value_tax) ? 'S' : 'N'
          lines << [invoice.number, rule.number, result]
          CsvWriter.write_csv_output(lines)
          break #If match with rule, go to next invoice
        end
      end
    end
  end

  private
  def load_invoices
    reader = CsvReader.new
    reader.read_csv_entries(ENTRY_FILENAME)
  end

  def load_rules
    reader = CsvReader.new
    reader.read_csv_rules(RULE_FILENAME)
  end

end

Validator.new.check