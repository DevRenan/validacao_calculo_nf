class CsvReader
  require 'csv'
  require './invoice.rb'
  require './rule.rb'
  
  def read_csv_entries(csv_filename)
    invoices = []
    CSV.foreach(csv_filename, headers: true) do |row|
      invoices <<  Invoice.new(row["NUMERO"],row["OPERACAO"],row["CLASSIFICACAO"],row["VALOR"],row["VALOR_IMPOSTO"])
    end
    invoices
  end

  def read_csv_rules(csv_filename)
    rules = []
    CSV.foreach(csv_filename, headers: true) do |row|
      rules <<  Rule.new(row["REGRA"],row["OPERACAO"],row["CLASSIFICACAO"],row["ALIQUOTA"])
    end
    rules 
  end
end
