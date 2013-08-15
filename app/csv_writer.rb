class CsvWriter
  require 'csv'

  FILENAME = "../csv_files/output.csv"

  def self.write_csv_output(lines)  
    CSV.open(FILENAME, 'w') do |csv|
      csv <<  ['NUMERO','REGRA','CORRETO' ]
      lines.each{|l| csv << l}
    end
  end
end
